FROM python:3.7.3-alpine

RUN apk add --update alpine-sdk netcat-openbsd
RUN mkdir -p /app
WORKDIR /app
COPY . /app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["sh", "-c", "tap-pendo --config /etc/config/tap.json --catalog catalog.json | nc -N -l 8080"]
