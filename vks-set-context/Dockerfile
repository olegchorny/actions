FROM ubuntu:latest

LABEL "com.github.actions.name"="VKS set context"
LABEL "com.github.actions.description"="configure k8s context for your VKS cluster "
LABEL "com.github.actions.icon"="mic"
LABEL "com.github.actions.color"="purple"

LABEL "repository"="http://github.com/ventus-ag/actions"
LABEL "homepage"="http://github.com/ventus-ag"
LABEL "maintainer"="Oleg <oleg.chornyi@ventus.ag"

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y python python-pip python-dev openssl && \
  pip install wheel && pip install python-openstackclient && pip install python-magnumclient

# ADD entrypoint.sh /entrypoint.sh
# ENTRYPOINT ["/entrypoint.sh"]
ENTRYPOINT ["openstack", "coe", "cluster", "list"]
