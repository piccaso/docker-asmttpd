FROM alpine
ADD tiny/root.tar.gz /
CMD ["/bin/asmttpd","/var/www"]
