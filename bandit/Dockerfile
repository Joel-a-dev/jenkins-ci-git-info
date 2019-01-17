FROM alpine

ENV PYTHONUNBUFFERED 1
ENV user=bandit

# install python and bandit 
RUN echo "**** install runtime packages ****"      && \
    apk add --no-cache py2-pip python2 bash        && \
    echo "**** install pip packages ****"          && \
    pip install --no-cache-dir -U pip              && \
    pip install --no-cache-dir -U bandit           && \
    echo "**** create volumes ****"                && \
    mkdir -p /src                                  && \
    mkdir -p /bandit                               && \
    echo "**** user creation ****"                 && \
    addgroup -S bandit                             && \
    adduser -D -S -h /src -G bandit bandit         && \
    chown -R bandit:bandit /bandit

USER ${user}

COPY ../* /bandit/app

WORKDIR /bandit

RUN echo $(ls)

CMD ["/bandit/app/bandit/run_bandit.sh"]