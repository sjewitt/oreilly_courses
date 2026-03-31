import pytest

@pytest.fixture
def a():
    print("fixture a called")
    return 10

@pytest.fixture
def b():
    print("fixture b called")
    return 20

# fixtures can request other fixtures:
@pytest.fixture
def c(b):
    print("fixture c called")
    return b+20

# applies to all in module. HOWEVER, because we haven't explocitly added to the func args, we DO NOT have 
# access to the return value
@pytest.fixture(autouse=True)
def d():
    print("fixture d called")
    yield 100000
    print("tearing down fixture d")

@pytest.fixture
def f():
    print("fixture f called: DATABASE TEARDOWN")

@pytest.fixture
def e():
    print("fixture e called: DATABASE SETUP")
    # return 30   # this causes the folowing code to be unreachable...
    # so yield instead:
    # This means that the value is returned, BUT the control returned to here once the test has finished!!
    yield 30
    print("in fixture - after yield: teardown DATABASE")





# a non test_ function - does some operation:

def multiply():
    ## initialisation
    print("database related code")

# apply the fixture to return some preamble stuff:
# note it is a test_ function argument - so pytest knows about this pattern?
def test_mod(a,b):
    ## initialisation
    print("database related code : ", str(a), str(d))   # prints the return value of `a()`

def test_multiply(a,b):
    ## can also pass > 1 fixture
    print("database related code : ", str(a), str(b), str(b/a), str(d))   # prints the return value of `a()` and `b()`, and can do opewrations on the result

def test_divide(a,b):
    ## initialisation
    print("database related code : ", str(b), str(d))   # prints the return value of `b()`

def test_sausage(c):
    ## initialisation
    print("database related code : ", str(c), str(d))   # prints the return value of `c()`
    assert c == 40

def test_yield_example(e):
    print(f"some database related test logic {e}...")
    print("but I need to CLOSE database conn...")
    assert e == 30
    