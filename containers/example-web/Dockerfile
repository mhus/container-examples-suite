FROM nginx:latest

RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html && \
    chown -R nginx:nginx /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html && \
    chmod -R 777 /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html
RUN rm /usr/bin/su /usr/bin/curl
ADD run.sh /run.sh
USER nginx
ENTRYPOINT ["/bin/bash"]
CMD ["/run.sh"]