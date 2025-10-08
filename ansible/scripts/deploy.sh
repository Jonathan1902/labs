#!/bin/bash
set -e

# 1. Executa o Terraform
cd infra
terraform apply -auto-approve

# 2. Obtém o IP da instância criada
INSTANCE_IP=$(terraform output -raw instance_ip)

# 3. Gera inventário do Ansible dinamicamente
cd ../ansible
cat <<EOF > inventory/hosts.ini
[web]
$INSTANCE_IP ansible_user=ec2-user ansible_ssh_private_key_file=~/.ssh/my-keypair.pem
EOF

# 4. Executa o Ansible
#ansible-playbook -i inventory/hosts.ini playbooks/deploy.yml
