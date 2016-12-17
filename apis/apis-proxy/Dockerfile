FROM nginx

ADD https://releases.hashicorp.com/consul-template/0.16.0/consul-template_0.16.0_linux_amd64.zip /tmp/consul-template.zip
ADD nginx.conf.ctmpl /tmp/

RUN apt-get update \
 && apt-get install -y unzip \
 && unzip /tmp/consul-template.zip -d /usr/local/bin \
 && mkdir -p /var/lib/consul-template/templates/ \
 && mv /tmp/nginx.conf.ctmpl /var/lib/consul-template/templates/

EXPOSE 80

ENTRYPOINT service nginx start \
        && consul-template -consul consul.service.private:8500 -template "/var/lib/consul-template/templates/nginx.conf.ctmpl:/etc/nginx/nginx.conf:service nginx reload"
