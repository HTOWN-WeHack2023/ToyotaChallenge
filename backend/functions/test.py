import time
from detect_phone import detect_phone


phone_found = ""

while True:
    if(detect_phone() == True):
        phone_found = "found"
        print(phone_found)
        #time.sleep(0.09)
        phone_found = ""



