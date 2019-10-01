FROM buildpack-deps:latest

COPY entry-point.sh /entry-point.sh
RUN chmod +x /entry-point.sh

COPY toolkit.sh /toolkit.sh

ENTRYPOINT ["/entry-point.sh"]