FROM mongo

VOLUME /data/db

ADD run.sh set_mongodb_password.sh /

# Make files executable
RUN chmod 0777 /run.sh && \
	chmod 0777 /set_mongodb_password.sh

EXPOSE 27017

CMD ["/run.sh"]
