# eg database connections...


# demo:
# each test is INDEPENDENT, therefore, might need to init a database connection each time:

def test_multiply():
    print("multiply executed")

def test_divide():
    print("divide executed")

def test_mod():
    print("mod executed")


# so we to setup teardown...
# module level
def setup_module():
     print("\nopen DB conn (module)")

def teardown_module():
     print("\nclose DB conn (module)")


def setup_function():
     print("\nopen DB conn (func)")

def teardown_function():
     print("\nclose DB conn (func)")

# is there a GLOBAL setup()/teardown() as well? NOPE
def setup():
     print("\nopen DB conn (global?)")

def teardown():
     print("\nclose DB conn (global?)")