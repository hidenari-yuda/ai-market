OS=linux
ARCH=amd64
ROOT=$(GOPATH)/src/github.com/hidenari-yuda/ai-market

.PHONY: setup
setup:
	sh ./scripts/setup-front.sh
	sh ./scripts/setup-go.sh
	sh ./scripts/setup-py.sh

.PHONY: build go
build:
	cd cmd
	go mod tidy
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/app

.PHONY: wire
wire:
	wire ./infra/di/wire.go

# .PHONY: run-go
run-go:

.PHONY: wire
up:
	docker-compose -f docker-compose.yml up --build -d --log-opt max-size=100m --log-opt max-file=10 my-docker-image

up-all:
	docker-compose -f docker-compose.yml up --build -d --log-opt max-size=100m --log-opt max-file=10

down:
	docker-compose -f docker-compose.yml down --volumes


# encode envfile
encode-envfile:
	cat .env | base64 > env.pem

# decode envfile
# cat env.pem | base64 -d | xargs -I{} echo {} > .env
decode-envfile:
	cat env.pem | base64 -d > .env

migrate-new:
	sql-migrate new -env=local -config=.conf/dbconfig.yml ${FILE}

migrate-up:
	sql-migrate up -config=.conf/dbconfig.yml -env=local

migrate-down:
	sql-migrate down -config=.conf/dbconfig.yml -env=local


## Test Command
test:
	make down-test-db
	make up-test-db
	make test-all
	make down-test-db

test-all:
	make mock
	make repository-test
	# make entity-test

repository-test:
	DB_NAME=ai_market_test go test -v ./tests/repository/*_test.go

#entity-test:
	#go test -v ./tests/entity/*_test.go

## Mock
mock: repository-mock interactor-mock driver-mock # usecase-mock

repository-mock:
	mockgen -source ./usecase/repository.go -destination ./mock/mock_usecase/mock_repository.go

interactor-mock: 
	basename -a ./usecase/interactor/*.go | sed 's/.go//' | xargs -IFILE mockgen -source ./usecase/interactor/FILE.go -destination ./mock/mock_interactor/mock_FILE.go
	rm ./mock/mock_interactor/mock_wire_set.go

driver-mock: 
	mockgen -source ./usecase/driver.go -destination ./mock/mock_usecase/mock_driver.go

usecase-mock:
	mockgen -source ./usecase/usecase.go -destination ./mock/mock_usecase/mock_usecase.go