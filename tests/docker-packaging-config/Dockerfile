FROM tensorflow/tensorflow

COPY files /opt/app
COPY start-cmd.sh /start-cmd.sh

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y nodejs && \
    chmod +x /*.sh

CMD ["/start-cmd.sh"]
