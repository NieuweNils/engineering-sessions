curl -X POST --header 'Content-Type: application/json' localhost:8080/api/customers -d '{"name": "Pieter", "dateOfBirth": "2420-04-20T10:00:00.000+00:00", "gender": "MALE", "standaardJaarVerbruik": 1020, "sleeper": true, "funnyNickName": "PewdiePiets"}'
curl -X POST --header 'Content-Type: application/json' localhost:8080/api/customers -d '{"name": "Susanne", "dateOfBirth": "2420-04-20T10:00:00.000+00:00", "gender": "FEMALE", "standaardJaarVerbruik": 420, "sleeper": false, "funnyNickName": "susanders"}'
curl -X POST --header 'Content-Type: application/json' localhost:8080/api/customers -d '{"name": "Nils", "dateOfBirth": "2420-04-20T10:00:00.000+00:00", "gender": "MALE", "standaardJaarVerbruik": 1420, "sleeper": true, "funnyNickName": "Vicky de wiki-ing"}'
curl -X POST --header 'Content-Type: application/json' localhost:8080/api/customers -d '{"name": "Nils", "dateOfBirth": "2420-04-20T10:00:00.000+00:00", "gender": "MALE", "standaardJaarVerbruik": 1420, "sleeper": true, "funnyNickName": "Vicky de wiki-ing"}'

curl -X GET localhost:8080/api/customer/1 | jq
curl -X GET 'localhost:8080/api/customer?name=Nils' | jq