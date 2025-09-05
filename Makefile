build-container:
	docker compose build

start-dev-container:
	docker compose up app -dev

start-libsql-server:
	docker compose --profile db up sqld -d

stop-libsql-server:
	docker compose --profile db down sqld