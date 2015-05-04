FROM distribution/registry

COPY registry-wrapper.sh /tmp/registry-wrapper.sh
RUN chmod 0550 /tmp/registry-wrapper.sh
RUN mkdir -p /etc/registry
COPY registry-config.yml /etc/registry/config.yml

ENTRYPOINT ["/tmp/registry-wrapper.sh"]
