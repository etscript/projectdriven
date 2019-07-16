# Kubernetes 快速安装
### Kubernetes master 和 Kubernetes slave
> 添加源

```
apt-get install -y apt-transport-https
curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main
EOF

apt-get update
```
> 安装docker，kubernetes

```
apt-get install docker.io=18.06.1-0ubuntu1.2~16.04.1
apt-get install kubernetes-cni=0.6.0-00
apt-get install kubeadm=1.12.0-00 kubelet=1.12.0-00 kubectl=1.12.0-00
```
### Kubernetes master 
> kubernetes 初始化

```
kubeadm init

mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# kubectl taint node master node-role.kubernetes.io/master:NoSchedule-

# (往master上调度)
```

### Kubernetes slave
> kubernetes 加入

```
master上初始化的时候有下面这条命令

kubeadm join 172.30.81.69:6443 --token 1oavg9.35jc5db02ntw82ux --discovery-token-ca-cert-hash sha256:f68e58f0dbb50871102890bf57f7175ab8422ed34561ea22b544075e9e43c58a
```

> 到此Kubernetes快速安装完成

