build:
		docker-compose build

run:
	docker-compose run --rm --service-ports web $(filter-out $@,$(MAKECMDGOALS))

console:
	docker-compose run --rm --service-ports web iex
