SHELL := /bin/bash

## Lint terraform code
lint:
	@echo "TODO"

terraform-docs:
	@terraform-docs markdown table --output-file docs/terraform.md --output-mode inject .

sync-with-template:
	@git clone git@github.com:jakoberpf/terraform-module-template.git _temp
	@rm -rf .github
	@cp -r _temp/.github .
	@rm -rf _temp