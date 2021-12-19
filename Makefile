.PHONY: init-all
init-all:
	cd envs/dev && \
	terragrunt run-all init -reconfigure

.PHONY: plan-all
plan-all:
	cd envs/dev && \
	terragrunt run-all plan

.PHONY: apply-all
apply-all:
	cd envs/dev && \
	terragrunt run-all apply

.PHONY: destroy-all
destroy-all:
	cd envs/dev && \
	terragrunt run-all destroy

.PHONY: graph-dependencies
graph-dependencies:
	cd envs/dev && \
	terragrunt graph-dependencies

.PHONY: fmt
fmt:
	terragrunt hclfmt
