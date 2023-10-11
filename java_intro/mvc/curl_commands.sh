curl localhost:8080/customer/1 | jq
curl localhost:8080/customer/2 | jq
#curl -X POST --header 'Content-Type: application/json' localhost:8080/addCustomer -d '{"id": 3, "name": "Nils", "dateOfBirth": "2420-04-20T10:00:00.000+00:00", "gender": "MALE", "standaardJaarVerbruik": 1420, "sleeper": true, "funnyNickName": "Vicky de wiki-ing"}'
