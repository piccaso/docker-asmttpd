FROM alpine
RUN \
  mkdir /tmp/build && cd $_ && \
  apk add --update yasm make binutils curl && \
  curl -o asmttpd.tar.gz https://codeload.github.com/nemasu/asmttpd/tar.gz/master && \
  tar -zxvf *.tar.gz && \
  cd asmttpd* && \
  make release && \
  cp asmttpd /usr/local/bin/ && \
  apk del yasm make binutils curl && \
  rm -rf /tmp/* /var/tmp/* /var/cache/apk/* && \
  mkdir -p /var/www && echo "it works!" > /var/www/index.html

CMD ["asmttpd","/var/www"]
