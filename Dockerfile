FROM node:6.10
LABEL maintainer="Rupak Ganguly <rupakg@gmail.com>"

RUN apt-get update && \ 
    apt-get install python-dev -y && \ 
    apt-get clean
RUN npm install -g serverless@1.14.0 && \ 
    curl -O https://bootstrap.pypa.io/get-pip.py 
RUN python get-pip.py 
RUN pip install awscli

# install other npm packages
npm install --global surge

WORKDIR /home/svrless
CMD ["sls", "--help"]
