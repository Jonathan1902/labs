# Execute o comando abaixo para criar a imagem Docker

docker build -t jonnies-labs:lab-infra .


# Execute o comando abaixo para criar o container Docker

docker run -dit --name jonnies jonnies-labs:lab-infra /bin/bash

# Conectar no Container via Terminal

docker exec -it jonnies /bin/bash

# Verifique as versões do Terraform e do AWS CLI com os comandos abaixo

terraform version
ansible --version
aws --version