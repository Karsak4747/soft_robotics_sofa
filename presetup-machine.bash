#!/bin/bash
# Создание пользователя
sudo useradd -m -d /home/sit -s /bin/bash sit
sudo echo -e "sit\nsit\n" | passwd sit
sudo usermod -aG sudo sit
su sit
mkdir -p /home/sit/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBUN60tdTcIjt3xCVb8vTCBGaX2R3i4hl8LRjTdZkTA9hYRHUSa0lvVOv6/mtwH1D8DqK3zqGK+k/yaRkKU8NmqzExWw6lk5rt1UAKOO/uTPtvbtI/29EPUAZNid5MIh1zGKoeXf7oGRdCUhTmrxFnhok4sgEtbcGYRwib4VVngz2VwIr85IQh+YebsrzDueXfv6kATR7kj9Ahw11eFfedHyrf3lcfI24Xi2zk23O1YBJ87fc635ENipBlNx0WjObXXNbP+32P3VdF7T8dath5Kzd5e5NkoLhZKcU9RPYp3iI6+lS1hkelFcj/eEmxzLKvnfXQl2UUmzo5TTccu1NTF1WkG6gaq392jTm+6XLS8pz2Ryt7U7W4QfJ+JmDUqKpTvo3//TXbP67lwoRbiD1s4/iDL1ooPPBw6aVLvFRNBCzluc/M0uiXu4cSvafs9KBuyUww5uogI8S7ubYycsK/frxX8L683PQh7r/ovpzpAvO+pujriJ7WUdJMs0/swec= dev47@dm" >> /home/sit/.ssh/authorized_keys 