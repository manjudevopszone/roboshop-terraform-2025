dev-apply:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=env-dev/state.tfvars
	terraform apply -auto-approve -var-file=env-dev/main.tfvars -var vault_token=$(vault_token)
	## User name and password should not be hardcoded, Here we just hardcorded because to avoid the passing of input. this need to be passed as input in the real time.

dev-destroy:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=env-dev/state.tfvars
	terraform destroy -auto-approve -var-file=env-dev/main.tfvars -var vault_token=$(vault_token)
	## User name and password should not be hardcoded, Here we just hardcorded because to avoid the passing of input. this need to be passed as input in the real time.

prod-apply:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=env-prod/state.tfvars
	terraform apply -auto-approve -var-file=env-dev/main.tfvars -auto-approve -var vault_token=$(vault_token)
	## User name and password should not be hardcoded, Here we just hardcorded because to avoid the passing of input. this need to be passed as input in the real time.

prod-destroy:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=env-prod/state.tfvars
	terraform destroy  -auto-approve -var-file=env-dev/main.tfvars -var vault_token=$(vault_token)
	## User name and password should not be hardcoded, Here we just hardcorded because to avoid the passing of input. this need to be passed as input in the real time.
