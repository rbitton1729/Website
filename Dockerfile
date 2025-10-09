FROM alpine:3.20 AS builder

RUN echo "@community https://dl-cdn.alpinelinux.org/alpine/v3.20/community" \
      >> /etc/apk/repositories && \
    apk add --no-cache zola

WORKDIR /site
COPY src/ .
RUN zola build --force

FROM nginx:alpine
COPY --from=builder /site/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
