FROM python:3.6-slim

RUN apt-get update && \
    apt-get install -y tree
RUN apt-get install -y ca-certificates git && pip install bandit 
RUN mkdir -p /bandit                               && \
    chown -R $USER: /bandit

COPY . /bandit

RUN chmod +x /bandit/shared/run_bandit.sh

WORKDIR /bandit

RUN echo "SEE THE TREE"
RUN echo "::::::::::::::::::::::::::"
RUN echo $(tree)
RUN echo "::::::::::::::::::::::::::"

CMD ["./shared/run_bandit.sh"]

