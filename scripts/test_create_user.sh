#! bin/bash
  # string name = 4;
  # string email = 5;
  # string password = 6;
  # enum UserType {
  #   NONE = 0;
  #   NORMAL = 1;
  #   ADMINISTRATOR = 2;
  #   GUEST = 3;
  #   DISABLED = 4;
  # }
  # UserType user_type = 7;
  # google.protobuf.Timestamp created_at = 8;
  # google.protobuf.Timestamp updated_at = 9;
grpcurl -plaintext -d '{"id": 1, "uuid": "", "firebase_id": "", "name": "test", "email": "testemail", "password": "testpassword" } ' localhost:8080 user.UserService.CreateUser

 grpcurl -plaintext -d '{"id": 1}' localhost:8080 user.UserService.GetUserById