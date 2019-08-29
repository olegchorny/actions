#!/bin/bash 

add-apt-repository universe
apt-get install python3-pip -y 
pip install wheel
pip install python-openstackclient
pip install python-magnumclient
# export OS_AUTH_URL=${{ secrets.AUTH_URL }}
# export OS_PROJECT_ID=${{ secrets.PROJECT_ID }}
# export OS_PROJECT_NAME=${{ secrets.PROJECT_NAME }}
# export OS_USER_DOMAIN_NAME=${{ secrets.USER_DOMAIN_NAME }}
if [ -z "$OS_USER_DOMAIN_NAME" ]; then unset OS_USER_DOMAIN_NAME; fi
# export OS_PROJECT_DOMAIN_ID=${{ secrets.PROJECT_DOMAIN_ID }}
if [ -z "$OS_PROJECT_DOMAIN_ID" ]; then unset OS_PROJECT_DOMAIN_ID; fi
unset OS_TENANT_ID
unset OS_TENANT_NAME
# export OS_USERNAME=${{ secrets.USERNAME }}
# export OS_PASSWORD=${{ secrets.PASSWORD }}
# export OS_REGION_NAME=${{ secrets.REGION_NAME }}
if [ -z "$OS_REGION_NAME" ]; then unset OS_REGION_NAME; fi
export OS_INTERFACE=public
export OS_IDENTITY_API_VERSION=3
openstack coe cluster list
openstack coe cluster show ${{ secrets.CLUSTER_NAME }}
$(openstack coe cluster config ${{ secrets.CLUSTER_NAME }}) &
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl
export KUBECONFIG=./config
kubectl get pods --all-namespaces
