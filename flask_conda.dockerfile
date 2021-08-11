# Ref: https://pythonspeed.com/articles/activate-conda-dockerfile/
FROM continuumio/miniconda3

WORKDIR /app
LABEL description="This is the base docker image for the  experiment Flask."
RUN conda create -n test_flask python=3.7 
RUN echo "conda activate test_flask" >> ~/.bashrc 


WORKDIR /app
COPY requirements.txt  serve.py  entrypoint_flask.sh ./
SHELL ["/bin/bash", "--login", "-c"]
RUN pip install -r requirements.txt

EXPOSE 9998
RUN chmod +x entrypoint_flask.sh
ENTRYPOINT ["./entrypoint_flask.sh"]
# CMD ["/bin/bash"]
