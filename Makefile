build:
	sh ./build.sh

deploy:
	terraform init
	terraform apply
