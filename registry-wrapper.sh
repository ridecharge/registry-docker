#!/bin/sh
# From CloudFormation
sed -i "s/ENVIRONMENT/$ENVIRONMENT/g" /etc/registry/config.yml
sed -i "s/AWS_ACCESS_KEY/$AWS_ACCESS_KEY/g" /etc/registry/config.yml
sed -i "s/AWS_SECRET_KEY/$AWS_SECRET_KEY/g" /etc/registry/config.yml
sed -i "s/AWS_REGION/$AWS_REGION/g" /etc/registry/config.yml
sed -i "s/S3_BUCKET/$S3_BUCKET/g" /etc/registry/config.yml
sed -i "s/NR_TOKEN/$NR_TOKEN/g" /etc/registry/config.yml

# From Consul
HTTP_SECRET=$(curl consul:8500/v1/kv/registry/config/HTTP_SECRET\?raw)
REDIS_PASSWORD=$(curl consul:8500/v1/kv/redis/registry/password\?raw)
REDIS_ENDPOINT=$(curl consul:8500/v1/kv/redis/registry/endpoint\?raw)
sed -i "s/HTTP_SECRET/$HTTP_SECRET/g" /etc/registry/config.yml
sed -i "s/REDIS_PASSWORD/$REDIS_PASSWORD/g" /etc/registry/config.yml
sed -i "s/REDIS_ENDPOINT/$REDIS_ENDPOINT/g" /etc/registry/config.yml

exec registry /etc/registry/config.yml
