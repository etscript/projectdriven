for file in es-service es-statefulset fluentd-es-configmap fluentd-es-ds kibana-deployment kibana-service; do kubectl delete -f $file.yaml; done
