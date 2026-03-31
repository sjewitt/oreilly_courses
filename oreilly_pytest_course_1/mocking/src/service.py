# part 9: mocking
from src import db
import requests

def is_available():
    # checks availability of database
    print("DB proxy service")
    return db.check_availability()

# parameterised mocking
def validate_user(uname, pwd):
    actual_pwd = db.get_pwd(uname)
    if pwd == actual_pwd:
        return True
    return False

# JSON response: he calls a test remote server, so maybe I'll need to call an endpoint on BTED or somethng...
def get_user_data():
    # response = requests.get("https://mocki.io/v1/a68af8ae-48e7-4f19-b4dc-b7a6dc7feae2") # unavailable...
    # so lets use BTED:
    response = requests.get("http://localhost:5005/sensors/?exclude_sois=true")
    if response.status_code == 200:
        return list(response.json())
