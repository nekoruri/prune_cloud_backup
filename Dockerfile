FROM amazon/aws-cli:latest

RUN yum update -y \
  && yum install -y jq \
  && yum clean all

ADD prune_cloud_backup /prune_cloud_backup

ENTRYPOINT ["/prune_cloud_backup"]
