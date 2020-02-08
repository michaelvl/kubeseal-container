FROM python:3.7.4-slim-stretch

ARG KUBESEAL_VERSION="v0.9.7"
ENV KUBESEAL_VERSION=$KUBESEAL_VERSION

RUN apt-get -y update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -sLo /usr/local/bin/kubeseal https://github.com/bitnami-labs/sealed-secrets/releases/download/${KUBESEAL_VERSION}/kubeseal-linux-amd64 && chmod a+x /usr/local/bin/kubeseal

#ADD requirements.txt .
#RUN pip install -r ./requirements.txt

RUN mkdir -p /bin /work
WORKDIR "/work"
COPY kubeseal.py /bin/

ENTRYPOINT ["/bin/kubeseal.py"]
CMD ["--format", "yaml"]
