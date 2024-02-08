echo 'kubectl exec curl-pod -- curl -vvv localhost:1234/read'
kubectl exec curl-pod -- curl -vvv localhost:1234/read
echo "kubectl exec curl-pod -- curl -vvv localhost:1234/create -d '{\"circumference\": 4.20, \"seeds\": 3}'"
kubectl exec curl-pod -- curl -vvv localhost:1234/create -H "Content-Type: application/json"  -d '{"circumference": 4.20, "seeds": 3}'
echo 'kubectl exec curl-pod -- curl -vvv localhost:1234/read'
kubectl exec curl-pod -- curl -vvv localhost:1234/read
