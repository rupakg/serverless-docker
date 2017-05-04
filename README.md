# serverless-docker
docker image for serverless environment


## Build the image

```
docker build -t rupakg/serverless-docker .
```

## Run the image

```
# run the image to get a shell
docker run -it --name svrless -v ~/projects/svrless:/home/svrless rupakg/serverless-docker /bin/bash
```

```
# run the image to execute a sls command and delete the container
docker run --rm -v ~/projects/svrless:/home/svrless rupakg/serverless-docker
```

## Pass in the AWS Credentials to the container at runtime

```
# pass the AWS credential env vars. from host
docker run -it --name svrless \
           -v ~/projects/svrless:/home/svrless \
           -e AWS_ACCESS_KEY_ID \
           -e AWS_SECRET_ACCESS_KEY \
           rupakg/serverless-docker /bin/bash
```

OR

```
# pass the AWS credentials file from host
docker run -it --name svrless \
           -v ~/projects/svrless:/home/svrless \
           --env-file ~/.aws/credentials \
           rupakg/serverless-docker /bin/bash
```

