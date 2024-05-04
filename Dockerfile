FROM python:3.11.4-alpine
ENV DIRPATH=/app/giropops-senhas
WORKDIR $DIRPATH
COPY ./* $DIRPATH
COPY ./templates templates/
COPY ./static static/
#RUN apt-get update && apt-get install pip -y && pip install --no-cache-dir -r requirements.txt && \
    #apt-get clean && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir -r requirements.txt 
ENV REDIS_HOST=172.17.0.2
ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]
