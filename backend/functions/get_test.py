import time
from detect_phone import detect_phone
import requests

url = "http://127.0.0.1:8000/phone_detected/{phone_found}"

response = requests.get(url)

data = response.json()

print(data)




