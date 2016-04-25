FROM ubuntu:14.04
RUN apt-get update --yes && \
	apt-get upgrade --yes
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
    echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
    apt-get update --yes && \
	apt-get upgrade --yes && \
    apt-get install --yes mongodb-org && \
    mkdir -p /data/db
VOLUME /data/db

# Root password:
ENV rootPwd= \
    
	# Password for the database:
	dataPwd= \
	
	# Username for the database:
	dataUser=data \
	
	# Name of the database:
	dataName=Data
ADD run.sh /run.sh
ADD set_mongodb_password.sh /set_mongodb_password.sh
EXPOSE 27017
CMD ["/run.sh"]
