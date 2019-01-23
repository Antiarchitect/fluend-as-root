FROM fluent/fluentd:v1.3.3-1.0

USER root
RUN chown -R root:root /fluentd