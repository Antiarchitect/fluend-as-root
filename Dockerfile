FROM fluent/fluentd:v1.3.3-1.0

# RUN addgroup -S fluent && adduser -S -g fluent fluent

USER root

ARG gid=1000
ARG uid=1000

RUN [[ "x${uid}" = "x" ]] || deluser fluent
RUN [[ "x${gid}" = "x" ]] || sed -i "/:${gid}:/d" /etc/group
RUN [[ "x${gid}" = "x" ]] || addgroup -g ${gid} -S fluent
RUN [[ "x${gid}" = "x" || "x${uid}" = "x" ]] || adduser -u ${uid} -G fluent -D -S fluent

RUN chown -R fluent:fluent /fluentd

USER fluent