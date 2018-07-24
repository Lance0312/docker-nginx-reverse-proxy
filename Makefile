image_name = verdigristech/nginx-reverse-proxy

all: 
	make build
	make push

build:
	docker build -t $(image_name) .
	@echo "Done!  Use docker run $(image_name) to run"

push:
	docker push $(image_name)
	