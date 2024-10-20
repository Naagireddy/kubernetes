```
curl -fsSL https://get.docker.com -o install-docker.sh
sh install-docker.sh
sudo usermod -aG docker ubuntu
```

```
sudo apt-get update
# apt-transport-https may be a dummy package; if so, you can skip that package
sudo apt-get install -y apt-transport-https ca-certificates curl gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl 
```

```
wget https://github.com/Mirantis/cri-dockerd/releases/download/v0.3.9/cri-dockerd_0.3.9.3-0.ubuntu-jammy_amd64.deb
sudo dpkg -i cri-dockerd_0.3.9.3-0.ubuntu-jammy_amd64.deb

```

```
kubeadm init --cri-socket unix:///var/run/cri-dockerd.sock
```
```
kubeadm join 172.31.21.151:6443 --token uiei66.ibdixnmka1dj6do9 \
        --discovery-token-ca-cert-hash sha256:686d85a23ef071bd338eac409438c43eada59e2fc7f053e369d4e0b4ebed0503 --cri-socket unix:///var/run/cri-dockerd.sock
```


```
kubectl apply -f https://github.com/weaveworks/weave/releases/download/v2.8.1/weave-daemonset-k8s.yaml
```