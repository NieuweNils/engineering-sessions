import requests
import logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(name)s - %(levelname)s - %(message)s')


# sending out a request to receive a response
response = requests.get('http://localhost:8080/v1/hello')

# check what response we're getting
logging.info(f'{response.status_code=}')

# And what is it that we receive?
logging.info(f'{response.text}')

apple = {'seeds': 12, 'circumference': 3.123}


HOSTNAME = '0.0.0.0'
PATH = '/v1/apple'
PORT = '8080'
PROTOCOL = 'http'

response = requests.post(f'{PROTOCOL}://{HOSTNAME}:{PORT}{PATH}', json=apple)

logging.info(f'{response.status_code=}')
logging.info(f'{response.text=}')


response = requests.get(f'{PROTOCOL}://{HOSTNAME}:{PORT}/v1/apple/22')
logging.info(f'{response.status_code=}')
if response.status_code!= 200:
    logging.info(f'{response.content}')
else:
    logging.info(f'{response.json()}')


