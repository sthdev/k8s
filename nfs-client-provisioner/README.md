# install nfs provisioner

Installs a storage provisioner that provisions persistent volumes from an NFS share.

## install nfs-common on every cluster node
    apt install nfs-common

## create namespace nfs
    kubectl create namespace nfs-client-provisioner

## add helm stable repo
    helm repo add stable https://kubernetes-charts.storage.googleapis.com/

## install nfs-provisioner
    helm install nfs-client-provisioner --set nfs.server=ds.fritz.box --set nfs.path=/volume2/k8s/ stable/nfs-client-provisioner -n nfs-client-provisioner

## set nfs-client as default storage class
    kubectl patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

## set previous storage class as non-default
    kubectl patch storageclass microk8s-hostpath -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'