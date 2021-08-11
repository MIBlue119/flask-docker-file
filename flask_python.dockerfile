
FROM  python:3.7-buster
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

LABEL description="This is the base docker image for the  experiment Flask."
WORKDIR /root

RUN mkdir -p ~/miniconda3
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
RUN bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 
ENV  PATH=/root/miniconda3/bin/:$PATH
RUN conda create -n test_flask python=3.7
RUN conda init bash


RUN echo "conda activate test_flask" >> ~/.bashrc 


WORKDIR /app
COPY requirements.txt  serve.py  entrypoint_flask.sh ./
SHELL ["/bin/bash", "--login", "-c"]
RUN pip install -r requirements.txt

EXPOSE 9998
RUN chmod +x entrypoint_flask.sh
ENTRYPOINT ["./entrypoint_flask.sh"]
