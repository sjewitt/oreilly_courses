import pytest

# so we can do pytest.raises()

def test_exception_demo():
    print("begin")
    # this passes because teh `raises()` type is true
    with pytest.raises(ZeroDivisionError):
        print("testing for ZeroDivisionError")
        print(100/0)
    with pytest.raises(Exception):
        print("testing for plain Exception")
        print(100/0)
    with pytest.raises(FileNotFoundError):
        print("testing for plain FileNotFoundError (fill FAIL)")
        print(100/0)

def test_exception_returns_exception_object():
    # can use second `match=[regex]` to get the error string:
    # this validates that the message matches (and will FAIL if it doesn't)
    with pytest.raises(ZeroDivisionError, match=r".* by .*") as ex:
    # with pytest.raises(ZeroDivisionError, match=r".* bffy .*") as ex: # fails as doesn't match the value
        print("testing for ZeroDivisionError")
        print(100/0)
    print(type(ex)) # an ExceptionInfo instance

    # gives us access to:
    print(ex.type) ## ZeroDivisionError
    print(ex.value)
    print(ex.traceback)  