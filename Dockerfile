FROM cgr.dev/chainguard/python:latest-dev as builder
WORKDIR /app
COPY ./requirements.txt /app

RUN pip install --no-cache-dir -r requirements.txt --user

FROM cgr.dev/chainguard/python:latest

WORKDIR /app
COPY --from=builder /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages
#COPY --from=builder /home/nonroot/.local/bin/flask /home/nonroot/.local/bin/flask

COPY ./* /app
COPY ./templates /app/templates/
COPY ./static /app/static/

ENV REDIS_HOST=172.17.0.2
ENTRYPOINT ["python", "-m", "flask", "run", "--host=0.0.0.0"]
