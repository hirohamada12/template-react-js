FROM nginx:alpine
MAINTAINER business-frontend
COPY /build /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d
COPY nginx/nginx.tmpl /etc/nginx/conf.d
EXPOSE 80

WORKDIR /usr/share/nginx/html
COPY ./env.sh .
COPY .env .
RUN chmod +x env.sh

CMD ["/bin/sh", "-c", "/usr/share/nginx/html/env.sh && nginx -g \"daemon off;\""]