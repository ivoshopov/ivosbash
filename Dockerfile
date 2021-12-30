FROM ubuntu:latest

RUN apt-get update
RUN apt-get install make

WORKDIR /workspace/
COPY . .

CMD ["make", "test"]
