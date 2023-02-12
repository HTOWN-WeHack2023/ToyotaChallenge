from fastapi import FastAPI
#importing functions from function folder

import time

app = FastAPI()

@app.get("/phone_detected/")
def phone_detected():


    with open('isPhoneDetected.txt', 'r') as file:
        fileData = file.read()

    if fileData == 'true':
        with open('isPhoneDetected.txt', 'w') as file:
            file.write('false') 
            
        return {'message': True}

    return {'message': False}

    

