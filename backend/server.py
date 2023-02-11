from fastapi import FastAPI
#importing functions from function folder
from functions.test import hello

app = FastAPI()

@app.get("/")
def test():
    hello()
    return {"Request" : "Recieved"}

