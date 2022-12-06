FROM alpine:3.16

RUN mkdir -p ./etc/nginx/ssl
# update alpine && install nginx
RUN apk update && \
	apk add nginx openssl && \
	openssl req -x509 -sha256 -nodes -newkey rsa:2048 -days 365 \
	-keyout ./etc/nginx/ssl/localhost.key -out ./etc/nginx/ssl/localhost.csr \
	-subj "/C=FR/ST=PACA/L=Nice/O=42/OU=42/CN=ygaiero.42.fr/UID=ygaiero"

COPY /conf/default.conf ./etc/nginx/http.d

CMD ["nginx", "-g", "daemon off;"]