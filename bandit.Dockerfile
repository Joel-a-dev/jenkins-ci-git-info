FROM python:3.6-slim

WORKDIR /bandit

COPY . /bandit

RUN apt-get update && \
    apt-get install -y tree
RUN apt-get install -y ca-certificates git && pip install bandit 
RUN mkdir -p /bandit    

COPY . /bandit                         

CMD ["/bandit/shared/run_bandit.sh"]

