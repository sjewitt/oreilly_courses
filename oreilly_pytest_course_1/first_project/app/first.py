def add(a, b):
    try:
        print(a+b)  # string concatenation if str passed
        return a+b
    except Exception as ex:
        print(f"error: {ex}") 
        return ex

def multiply(a,b):
    return a*b

def divide(a,b):
    return a/b

