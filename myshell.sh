commit-sha=${kubectl get deployments.apps ${deploy-name} -o jsonpath='{@.spec.template.spec.containers[?(@.name=="${container-name}")].image}' | awk -F ":" '{print $2}' | cut -c 1-7}
POD=$(kubectl  get po | grep ${pod-name} | awk '{print $1}')
IP=$(kubectl get po ${POD} -o wide --no-headers | awk '{print $6}')