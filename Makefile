startdb:
	docker-compose up -d

stopdb:
	docker-compose down

createdb:
	docker-compose exec postgres createdb --username=root --owner=root simple_bank

dropdb:
	docker-compose exec postgres dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: startdb stopdb createdb dropdb migrateup migratedown sqlc
