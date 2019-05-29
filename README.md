## Etcd image for Cisco IOS XR


For ETCD single node
```bash

mkdir /misc/app_host/etcd
export DATA_DIR=/misc/app_host/etcd
export IP=172.20.100.150

docker run
  -itd \
  --cap-add=SYS_ADMIN \
  --cap-add=NET_ADMIN \
  -v /var/run/netns:/var/run/netns \
  --volume=${DATA_DIR}:/etcd-data \
  --name etcd ljm625/etcd-ios-xr:latest \
  /usr/local/bin/etcd \
  --data-dir=/etcd-data --name node1 \
  --initial-advertise-peer-urls http://${IP}:2380 \
  --listen-peer-urls http://${IP}:2380 \
  --advertise-client-urls http://${IP}:2379 \
   --listen-client-urls http://${IP}:2379 \
  --initial-cluster node1=http://${IP}:2380

```

For ETCD Cluster on multiple NCS5500


172.20.100.150
172.20.100.151
172.20.100.152

Host 1
```bash
mkdir /misc/app_host/etcd
export DATA_DIR=/misc/app_host/etcd
export IP=172.20.100.150
export NAME=etcd-node-0
NAME_1=etcd-node-0
NAME_2=etcd-node-1
NAME_3=etcd-node-2
HOST_1=172.20.100.150
HOST_2=172.20.100.151
HOST_3=172.20.100.152

CLUSTER_STATE=new
TOKEN=my-etcd-token


CLUSTER=${NAME_1}=http://${HOST_1}:2380,${NAME_2}=http://${HOST_2}:2380,${NAME_3}=http://${HOST_3}:2380

docker run
  -itd \
  --cap-add=SYS_ADMIN \
  --cap-add=NET_ADMIN \
  -v /var/run/netns:/var/run/netns \
  --volume=${DATA_DIR}:/etcd-data \
  --name etcd ljm625/etcd-ios-xr:latest \
  /usr/local/bin/etcd \
  --data-dir=/etcd-data --name ${NAME} \
  --initial-advertise-peer-urls http://${IP}:2380 \
  --listen-peer-urls http://${IP}:2380 \
  --advertise-client-urls http://${IP}:2379 \
   --listen-client-urls http://${IP}:2379 \
  --initial-cluster ${CLUSTER} \
  --initial-cluster-state ${CLUSTER_STATE} --initial-cluster-token ${TOKEN}

```


Host 2
```bash
mkdir /misc/app_host/etcd
export DATA_DIR=/misc/app_host/etcd
export IP=172.20.100.151
export NAME=etcd-node-1
NAME_1=etcd-node-0
NAME_2=etcd-node-1
NAME_3=etcd-node-2
HOST_1=172.20.100.150
HOST_2=172.20.100.151
HOST_3=172.20.100.152

CLUSTER_STATE=new
TOKEN=my-etcd-token


CLUSTER=${NAME_1}=http://${HOST_1}:2380,${NAME_2}=http://${HOST_2}:2380,${NAME_3}=http://${HOST_3}:2380

docker run
  -itd \
  --cap-add=SYS_ADMIN \
  --cap-add=NET_ADMIN \
  -v /var/run/netns:/var/run/netns \
  --volume=${DATA_DIR}:/etcd-data \
  --name etcd ljm625/etcd-ios-xr:latest \
  /usr/local/bin/etcd \
  --data-dir=/etcd-data --name ${NAME} \
  --initial-advertise-peer-urls http://${IP}:2380 \
  --listen-peer-urls http://${IP}:2380 \
  --advertise-client-urls http://${IP}:2379 \
   --listen-client-urls http://${IP}:2379 \
  --initial-cluster ${CLUSTER} \
  --initial-cluster-state ${CLUSTER_STATE} --initial-cluster-token ${TOKEN}

```

Host 3
```bash
mkdir /misc/app_host/etcd
export DATA_DIR=/misc/app_host/etcd
export IP=172.20.100.152
export NAME=etcd-node-2
NAME_1=etcd-node-0
NAME_2=etcd-node-1
NAME_3=etcd-node-2
HOST_1=172.20.100.150
HOST_2=172.20.100.151
HOST_3=172.20.100.152

CLUSTER_STATE=new
TOKEN=my-etcd-token


CLUSTER=${NAME_1}=http://${HOST_1}:2380,${NAME_2}=http://${HOST_2}:2380,${NAME_3}=http://${HOST_3}:2380

docker run
  -itd \
  --cap-add=SYS_ADMIN \
  --cap-add=NET_ADMIN \
  -v /var/run/netns:/var/run/netns \
  --volume=${DATA_DIR}:/etcd-data \
  --name etcd ljm625/etcd-ios-xr:latest \
  /usr/local/bin/etcd \
  --data-dir=/etcd-data --name ${NAME} \
  --initial-advertise-peer-urls http://${IP}:2380 \
  --listen-peer-urls http://${IP}:2380 \
  --advertise-client-urls http://${IP}:2379 \
   --listen-client-urls http://${IP}:2379 \
  --initial-cluster ${CLUSTER} \
  --initial-cluster-state ${CLUSTER_STATE} --initial-cluster-token ${TOKEN}

```