FROM nginx

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get -y install curl runit && \
    rm -rf /var/lib/apt/lists/*

ADD consul-template_0.19.4_linux_amd64.tgz /usr/local/bin/
ADD nginx.service /etc/service/nginx/run
RUN chmod a+x /etc/service/nginx/run
ADD consul-template.service /etc/service/consul-template/run
RUN chmod a+x /etc/service/consul-template/run

RUN rm -v /etc/nginx/conf.d/*
ADD nginx.conf.ctmpl /etc/service/consul-templates/nginx.conf.ctmpl

CMD ["/usr/bin/runsvdir", "/etc/service"]