kubectl create serviceaccount tiller --namespace kube-system --dry-run=true -o yaml | kubectl apply -f -
kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller --dry-run=true -o yaml | kubectl apply -f -
helm init --tiller-image=jessestuart/tiller --service-account tiller --upgrade