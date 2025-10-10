FROM alpine:3.20 AS builder

RUN echo "@community https://dl-cdn.alpinelinux.org/alpine/v3.20/community" \
      >> /etc/apk/repositories && \
    apk add --no-cache zola git

WORKDIR /site
COPY src/ .


RUN git clone https://git.rbitton.com/rbitton/Resume.git /tmp/resume && \
    mkdir -p static/files && \
    mkdir -p content/resume && \
    # cp /tmp/resume/RAPHAEL_BITTON.pdf static/files/ && \
    sh -c "(printf '+++\n\
title = \"Resume\"\n\
date = 2025-10-09\n\
+++\n\n' && cat /tmp/resume/RAPHAEL_BITTON.md) > content/resume/_index.md"

RUN zola build --force

FROM nginx:alpine
COPY --from=builder /site/public /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
