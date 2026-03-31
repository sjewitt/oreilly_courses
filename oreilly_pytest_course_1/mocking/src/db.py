# part 9: mocking

def check_availability():
    # checks availability of database
    print("calling DB back end to determine availability")
    return True

def get_pwd(uname):
    # retrieve pwd from DB
    print("actual DB method...")
    return("abcd")