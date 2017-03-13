FROM alpine:latest
MAINTAINER ZhiFeng Hu <hufeng1987@gmail.com>

ENV HUGO_VERSION 0.19
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

# Install pygments (for syntax highlighting)
RUN apk update && apk add py-pygments && apk add git && apk add bash && rm -rf /var/cache/apk/*

# Download and Install hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tgz /usr/local/
RUN tar xzf /usr/local/${HUGO_BINARY}.tgz -C /usr/bin/ \
	&& rm /usr/local/${HUGO_BINARY}.tgz