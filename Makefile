DB_URL=postgresql://root:secret@localhost:5432/simplebank?sslmode=disable

startdb:
	docker-compose up -d postgres

stopdb:
	docker-compose down

createdb:
	docker-compose exec postgres createdb --username=root --owner=root simplebank

dropdb:
	docker-compose exec postgres dropdb simplebank

migrateup:
	migrate -path db/migration -database "$(DB_URL)" -verbose up

migrateup1:
	migrate -path db/migration -database "$(DB_URL)" -verbose up 1

migratedown:
	migrate -path db/migration -database "$(DB_URL)" -verbose down

migratedown1:
	migrate -path db/migration -database "$(DB_URL)" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/paisit04/simplebank/db/sqlc Store

proto:
	rm -f pb/*.go
	rm -f doc/swagger/*.swagger.json
	protoc --proto_path=proto --go_out=pb --go_opt=paths=source_relative \
    --go-grpc_out=pb --go-grpc_opt=paths=source_relative \
		--grpc-gateway_out=pb  --grpc-gateway_opt=paths=source_relative \
		--openapiv2_out=doc/swagger --openapiv2_opt=allow_merge=true,merge_file_name=simple_bank \
    proto/*.proto

evans:
	evans --host localhost --port 9090 -r repl

.PHONY: startdb stopdb createdb dropdb migrateup migrateup1 migratedown migratedown1 sqlc server mock proto evans
