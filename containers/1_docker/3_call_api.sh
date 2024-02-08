echo 'curl -vvv localhost:1234/read'
curl -vvv localhost:1234/read
echo "curl -vvv localhost:1234/create -d '{\"circumference\": 4.20, \"seeds\": 3}'"
curl -vvv localhost:1234/create -H "Content-Type: application/json"  -d '{"circumference": 4.20, "seeds": 3}'
echo 'curl -vvv localhost:1234/read'
curl -vvv localhost:1234/read
