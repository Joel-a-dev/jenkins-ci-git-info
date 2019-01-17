FROM python:3.6-slim

WORKDIR /bandit

RUN apt-get update && \
    apt-get install -y tree
RUN apt-get install -y ca-certificates git && pip install bandit 
RUN mkdir -p /bandit                               && \
    chown -R $USER /bandit/

COPY . /bandit

CMD ["./shared/run_bandit.sh"]

