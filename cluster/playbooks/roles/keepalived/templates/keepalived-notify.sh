#!/bin/bash -eux

TYPE=$1
NAME=$2
STATE=$3

case $STATE in
        "MASTER")
                KUBECONFIG=/etc/kubernetes/admin.conf kubectl delete pod -n kube-system -l k8s-app=cilium-envoy --field-selector spec.nodeName=$(hostname)
                  exit 0
                  ;;
        "BACKUP")
                  exit 0
                  ;;
        "FAULT") 
                  exit 0
                  ;;
        *)        echo "unknown state"
                  exit 1
                  ;;
esac
