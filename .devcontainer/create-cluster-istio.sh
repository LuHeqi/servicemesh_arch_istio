# 前提：容器已安装kind 和 istioctl
kind create cluster --config kind-example-config.yml

istioctl manifest install

# 验证安装成功没有
istioctl manifest generate  > $HOME/generated-manifest.yaml
istioctl verify-install -f $HOME/generated-manifest.yaml

# 集群部署示例
kubectl apply -f  ../bookstore.yml
# 端口转发
kubectl port-forward service/istio-ingressgateway -n istio-system :80
# 浏览器打开浏览书城