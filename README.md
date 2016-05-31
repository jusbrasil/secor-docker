# Secor Dockerfile

Just a [Secor](https://github.com/pinterest/secor) Dockerfile


## How to run the container

`
docker run -e "SECOR_GROUP=secor_backup" -e "AWS_ACCESS_KEY=access_key" -e "AWS_SECRET_KEY=secret_key" -e "ZK_QUORUM=zk:2181" ... jusbrasil/secor-docker consumer
`
