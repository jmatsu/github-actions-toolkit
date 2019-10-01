FROM buildpack-deps:latest

COPY toolkit.sh /toolkit.sh

COPY entry-point.sh /entry-point.sh
RUN chmod +x /entry-point.sh

ENTRYPOINT ["/entry-point.sh"]