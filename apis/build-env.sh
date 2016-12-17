terraform apply
sleep 30
ansible-playbook -i inventory.py apis-masters.yml
sleep 10
ansible-playbook -i inventory.py apis-nodes.yml apis-gateways.yml
