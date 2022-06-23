# Backend Master Class [Golang + PostgreSQL + Kubernetes]

Ref: https://www.udemy.com/course/backend-master-class-golang-postgresql-kubernetes
Ref: https://github.com/techschool/simplebank

## Tools

- [dbdiagram.io](https://dbdiagram.io) - A free, simple tool to draw ER diagrams by just writing code.
- [golang-migrate](https://github.com/golang-migrate/migrate) - Database migrations written in Go. Use as CLI or import as library.
- [sqlc](https://sqlc.dev/) - sqlc generates fully type-safe idiomatic code from SQL.

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
