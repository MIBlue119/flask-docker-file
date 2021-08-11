# [Note] A flask template with dockerfile

# Intro
This repo is a practice to construct a flask based service

# Ref
- Python Web Flask 實戰開發教學 - 簡介與環境建置
https://blog.techbridge.cc/2017/06/03/python-web-flask101-tutorial-introduction-and-environment-setup/

- Flask with gunicorn
https://sean22492249.medium.com/flask-with-gunicorn-9a37bca29227
```
```

# Material
- requirements.txt: flask dependecny
- serve.py: script to operate sound separation
- flask_conda.dockerfile: recored the step to construct flask
- docker-compose.yml: 

# flask_conda.dockerfile
This docker file is for test the flask service using.
## Build the image
```=bash
$ docker build -f flask.dockerfile -t test_flask_image .
```
## Up the cotainer
```=bash
$ sudo docker run -it --name test_flask_container test_flask_image /bin/bash
```

## if you want to rm the container after exit the container
```=bash
$ sudo docker run --rm -it --name test_flask_container test_flask_image /bin/bash
```

# Other
- Build without cache
```
$ sudo docker-compose build --no-cache api
```
- Look the resource used at a container
```
$ sudo docker top 69cba92b5a44
```
- Remove build cache
```
$ sudo docker builder prune
```
- Monitor the resource that used by the container
```
$ sudo docker stats docker_container
```

