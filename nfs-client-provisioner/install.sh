#!/bin/bash

microk8s.helm3 install nfs --set nfs.server=ds.fritz.box --set nfs.path=/volume2/k8s/ stable/nfs-client-provisioner

# Set as default storage class
microk8s.kubectl patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'