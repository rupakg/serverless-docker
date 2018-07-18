FROM node:6.10
LABEL maintainer="Rupak Ganguly <rupakg@gmail.com>"

RUN apt-get update && \
    apt-get install python-dev -y && \
    apt-get clean
RUN npm install -g serverless@1.28.0 && \
    curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install awscli

# install dev tools
# libsecret-1-dev needed by keytar for azure
RUN apt-get install tree -y && \
    apt-get install nano -y && \
    apt-get install libsecret-1-dev -y && \
    apt-get clean

# expose ports for dashboard
EXPOSE 8000

WORKDIR /home/svrless
CMD ["sls", "--help"]
