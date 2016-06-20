#! /bin/sh

TARGET_NAME=${1:-$TARGET_NAME}
TARGET_PORT=${2:-$TARGET_PORT}
ETCD_KEY=${3:-$ETCD_KEY}
POLING=${4:-${POLING:-0}}

TARGET_ADDRESS=`cat /etc/hosts | grep ${TARGET_NAME} | head -n1 | cut -f 1`

CMD="etcdctl --no-sync set ${ETCD_KEY} ${TARGET_ADDRESS}:${TARGET_PORT}"
echo ${CMD}
${CMD}

if [ ${POLING} -ne 0 ]
then
    sleep ${POLING}
    $0 $TARGET_NAME $TARGET_PORT $ETCD_KEY $POLING
fi

