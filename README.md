```
$ pip install pipenv
$ pipenv --python 3.7
$ pipenv shell
```

```
$ docker build ./ -t stacking
$ docker images
stacking_test                                    latest              95da5ee55121        50 seconds ago      1.57GB
```

```
$ docker run -p 8888:8888 -d -v /自分のPCのパスを入れてください/stacking_classifier/src:/root/user/src stacking /sbin/init
```

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS                    NAMES
9e6552200fa1        stacking       "/sbin/init"        About a minute ago   Up About a minute   0.0.0.0:8888->8888/tcp   epic_boyd
$ docker exec -it epic_boyd /bin/bash
```

inside container
```
# jupyter notebook --ip=0.0.0.0 --allow-root --NotebookApp.token=''
```

web browser
```
http://localhost:8888/tree?
```

