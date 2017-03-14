FROM alpine:latest
MAINTAINER ZhiFeng Hu <hufeng1987@gmail.com>

ENV HUGO_VERSION 0.19
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit
ENV HUGO_BINARY_REAL hugo_${HUGO_VERSION}_linux_amd64
#https://github.com/spf13/hugo/releases/download/v0.19/hugo_0.19_Linux-64bit.tar.gz

# Install pygments (for syntax highlighting)
RUN apk update && apk add py-pygments && apk add git && apk add bash && rm -rf /var/cache/apk/*

# Download and Install hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /usr/local/
RUN tar xzf /usr/local/${HUGO_BINARY}.tar.gz -C /usr/local/ \
	&& rm /usr/local/${HUGO_BINARY}.tar.gz \
	&& mv /usr/local/${HUGO_BINARY_REAL}/${HUGO_BINARY_REAL} /usr/bin/hugo