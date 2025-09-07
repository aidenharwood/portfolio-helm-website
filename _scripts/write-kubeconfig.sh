TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token) && \
cat > /kube/config <<EOF
apiVersion: v1
kind: Config
clusters:
- name: in-cluster
  cluster:
    server: https://${KUBERNETES_SERVICE_HOST}:${KUBERNETES_SERVICE_PORT}
    certificate-authority: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
contexts:
- name: in-cluster
  context:
    cluster: in-cluster
    user: default
current-context: in-cluster
users:
- name: default
  user:
    token: "${TOKEN}"
EOF