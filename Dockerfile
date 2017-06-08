FROM node:6.10
LABEL maintainer="Rupak Ganguly <rupakg@gmail.com>"

RUN apt-get update && \ 
    apt-get install python-dev -y && \ 
    apt-get clean
RUN npm install -g serverless@1.15.3 && \ 
    curl -O https://bootstrap.pypa.io/get-pip.py 
RUN python get-pip.py 
RUN pip install awscli

# install dev tools
RUN apt-get install tree -y && \
    apt-get install nano -y && \
    apt-get clean

# install other npm packages
RUN npm install -g surge

WORKDIR /home/svrless
CMD ["sls", "--help"]
