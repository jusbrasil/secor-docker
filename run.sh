#!/bin/bash

set -e

if [ "$1" = 'consumer' ]; then
  java -ea -Dsecor.kafka.group=${SECOR_GROUP} \
    -Daws.access.key=${AWS_ACCESS_KEY} \
    -Daws.secret.key=${AWS_SECRET_KEY} \
    -Dzookeeper.quorum=${ZK_QUORUM} \
    -Dkafka.zookeeper.path=${ZK_PATH} \
    -Dkafka.seed.broker.host=${SEED_BROKER_HOST} \
    -Dkafka.seed.broker.port=${SEED_BROKER_PORT} \
    -Dsecor.s3.bucket=${S3_BUCKET} \
    -Dsecor.s3.path=${S3_PATH} \
    -Dsecor.kafka.topic_filter=${TOPIC_FILTER} \
    -Dsecor.message.parser.class=${MESSAGE_PARSER_CLASS} \
    -Dmessage.timestamp.name=${TS_NAME} \
    -Dsecor.local.path=${LOCAL_PATH} \
    -Dsecor.file.reader.writer.factory=${READER_WRITER_FACTORY} \
    -Dsecor.compression.codec=${COMPRESSION_CODEC} \
    -Dsecor.max.file.size.bytes=${MAX_FILE_SIZE} \
    -Dsecor.max.file.age.seconds=${MAX_FILE_AGE} \
    -Dsecor.parser.timezone=${TIMEZONE} \
    -Dlog4j.configuration=log4j.prod.properties \
    -Dconfig=secor.prod.backup.properties \
    -cp secor.jar:lib/* \
    com.pinterest.secor.main.ConsumerMain
fi

exec "$@"

