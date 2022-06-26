# Backend Master Class [Golang + PostgreSQL + Kubernetes]

Ref: https://www.udemy.com/course/backend-master-class-golang-postgresql-kubernetes
Ref: https://github.com/techschool/simplebank

## Tools

- [dbdiagram.io](https://dbdiagram.io) - A free, simple tool to draw ER diagrams by just writing code.
- [golang-migrate](https://github.com/golang-migrate/migrate) - Database migrations written in Go. Use as CLI or import as library.
- [sqlc](https://sqlc.dev/) - sqlc generates fully type-safe idiomatic code from SQL.
- [testify](https://github.com/stretchr/testify) - A toolkit with common assertions and mocks that plays nicely with the standard library.
- [gin](https://github.com/gin-gonic/gin) - Gin is a HTTP web framework written in Go (Golang).
- [viper](https://github.com/spf13/viper) - Go configuration with fangs.
- [gomock](https://github.com/golang/mock) - GoMock is a mocking framework for the Go programming language.
- [jwt-go](https://github.com/golang-jwt/jwt) - A go implementation of JSON Web Tokens.
- [paseto](https://github.com/o1egl/paseto) - Platform-Agnostic Security Tokens implementation in GO (Golang).
- [evans](https://github.com/ktr0731/evans) - universal gRPC client.

## Migrate

Install CLI

```sh
brew install golang-migrate
```

Test CLI

```sh
migrate -version
migrate -help
```

Create a migration

```sh
migrate create -ext sql -dir db/migration -seq init_schema
```

## sqlc

Install CLI

```sh
brew install sqlc
```

Test CLI

```sh
sqlc version
sqlc help
```

Init

```sh
sqlc init
```
