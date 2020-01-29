On controller1

Make sure you copy the SSH key from controller1 to all the other nodes

# If CDC
mkdir -p /home/rack/preqc

# Create the preqc Directory
mkdir /home/rack/preqc
cd /home/rack/preqc

# Make sure the proper python packages are installed
bash ./prereqs.sh

# Create the preqc virtual environment
virtualenv --python=python3 preqc_venv

# Activate the preqc virtual environment
source preqc_venv/bin/activate

# Install Ansible
pip3 install ansible==2.9.4

# Edit the inventory
vim inventory

# Test Ansible can communicate to all the nodes
ansible all -i ./inventory -m ping

# Run the PreQC playbooks
ansible-playbook -i ./inventory playbooks/main.yml

