FROM python:3.6-slim

ENV user=bandit

WORKDIR /bandit

COPY . /bandit

RUN apt-get update && \
    apt-get install -y tree
RUN apt-get install -y ca-certificates git && pip install bandit 
RUN mkdir -p /bandit                               && \
    echo "**** user creation ****"                 && \
    addgroup -S bandit                             && \
    adduser -D -S -h /src -G bandit bandit         && \
    chown -R bandit:bandit /bandit

CMD ["./shared/run_bandit.sh"]

