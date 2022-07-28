.PHONY: help

help: ## show this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%s\033[0m|%s\n", $$1, $$2}' \
	| column -t -s '|'

docker-build: ## Build the docker image
	docker build -t scrumonline -f Dockerfile  .

docker-run: ## Run the docker image locally
	docker run -it --rm \
	-p 8080:80 \
	-e HOST="http://localhost:8080" \
	scrumonline
