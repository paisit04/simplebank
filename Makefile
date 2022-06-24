startdb:
	docker-compose up -d

stopdb:
	docker-compose down

createdb:
	docker-compose exec postgres createdb --username=root --owner=root simplebank

dropdb:
	docker-compose exec postgres dropdb simplebank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simplebank?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/paisit04/simplebank/db/sqlc Store

.PHONY: startdb stopdb createdb dropdb migrateup migrateup1 migratedown migratedown1 sqlc server mock
