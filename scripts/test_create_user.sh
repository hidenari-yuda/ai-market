#! bin/bash

grpcurl -plaintext -d '{"id": 1, "uuid": "", "firebase_id": "", "name": "test", "email": "testemail", "password": "testpassword" } ' localhost:8080 user.UserService.CreateUser

# grpcurl -plaintext -d '{"id": 1}' localhost:8080 user.UserService.GetUserById