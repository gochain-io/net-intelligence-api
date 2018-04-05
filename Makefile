docker:
	docker build -t gochain/net-intelligence-api:latest .

release: docker
	./release.sh

.PHONY: docker release