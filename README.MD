# PreQC Process for 18.04 with Stein and newer

All of this will be run on controller1

Make sure you copy the SSH key from controller1 to all the other nodes

# Create the preqc Directory
```
# mkdir -p /home/rack/preqc  
# cd /home/rack/preqc
```

# Clone the repo
```
git clone <URL_OF_THIS_REPO> /home/rack/preqc
```

# Make sure the proper python packages are installed
```
# bash ./prereqs.sh
```

# Create the preqc virtual environment
```
# virtualenv preqc_venv
```

# Activate the preqc virtual environment
```
# source preqc_venv/bin/activate
```

# Install Ansible
```
(preqc_venv)# pip install ansible==2.9.4
```

# Edit the inventory
```
(preqc_venv)# vim inventory
```
As the hostnames for all the nodes won't be in `/etc/hosts` yet, use the following format for the inventory:
```
[controllers]
controller1 ansible_host=10.240.0.51
controller2 ansible_host=10.240.0.52
controller3 ansible_host=10.240.0.53

[infras]
infra1 ansible_host=10.240.0.41
infra2 ansible_host=10.240.0.42

[computes]
compute1 ansible_host=10.240.0.55
compute2 ansible_host=10.240.0.56
compute3 ansible_host=10.240.0.57

[ceph]
ceph1 ansible_host=10.240.0.58
ceph2 ansible_host=10.240.0.59
ceph3 ansible_host=10.240.0.60
```

# Test Ansible can communicate to all the nodes
```
(preqc_venv)# ansible all -i ./inventory -m ping
```

# Run the PreQC playbooks
```
(preqc_venv)# ansible-playbook -i ./inventory playbooks/main.yml
```
