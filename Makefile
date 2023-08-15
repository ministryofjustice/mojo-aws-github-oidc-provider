#!make
include .env
export

fmt:
	aws-vault exec $$AWS_VAULT_PROFILE -- terraform fmt --recursive

init:
	aws-vault exec $$AWS_VAULT_PROFILE -- terraform init -reconfigure \
	--backend-config="key=terraform.state"

validate:
	aws-vault exec $$AWS_VAULT_PROFILE -- terraform validate

plan-out:
	aws-vault exec $$AWS_VAULT_PROFILE -- terraform plan -no-color > planfile.tfplan

plan:
	aws-vault exec $$AWS_VAULT_PROFILE -- terraform plan

refresh:
	aws-vault exec $$AWS_VAULT_PROFILE -- terraform refresh

apply:
	aws-vault exec $$AWS_VAULT_PROFILE -- terraform apply

state-list:
	aws-vault exec $$AWS_VAULT_PROFILE -- terraform state list

destroy:
	aws-vault exec $$AWS_VAULT_PROFILE -- terraform destroy

clean:
	rm -rf .terraform/ terraform.tfstate*

.PHONY: fmt init validate plan-out plan refresh apply state-list destroy
