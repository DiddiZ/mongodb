# Introduction
In order to build this Docker container:
```
docker build -t mongodb .
```

In order to start this container:
```
docker volume create --name mongoHDD1
docker run -d -p 127.0.0.1:30000:27017 --name mongo01 -e rootPwd="PASS1" -e dataPwd="PASS2" -e dataUser=myuser -e dataName=MyDatabase -v mongoHDD1:/data/db/ --restart=always mongodb
```
