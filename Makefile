# ----------------------------------------------------------------------
# Make file for automation process running ansible
# ----------------------------------------------------------------------

# ----------------------------------------------------------------------
# Local variables for project
# ----------------------------------------------------------------------
FILE_INVENTORY_VAGRANTINIT=hosts_vagrant-init

usage:
	@echo "Usage:"
	@echo "  deploy-vagrantinit - Setup hosts for valid vagrant box"
	@echo ""
	@echo "  display-tasks      - Display tasks to run"
	@echo "  display-hosts      - Display all hosts"
	@echo ""
	@echo "  make deploy-vagrantinit OPTARG='-vvv' - Deploy with debug"

deploy-vagrantinit:
	@echo "=== Setup hosts for valid vagrant box ==="
	@echo " + Run ansible"
	@ansible-playbook $(OPTARG) -i $(FILE_INVENTORY_VAGRANTINIT) site-vagrant-init.yml

display-tasks:
	@echo "=== Display available tasks ==="
	@ansible-playbook $(OPTARG) -i $(FILE_INVENTORY_VAGRANTINIT) site-vagrant-init.yml --list-tasks

display-hosts:
	@echo "=== Display all hosts for configuration ==="
	@ansible $(OPTARG) -i $(FILE_INVENTORY_VAGRANTINIT) all --list-hosts
