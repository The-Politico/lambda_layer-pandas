build:
	sh ./build.sh

init:
	terraform init

deploy:
	terraform apply
