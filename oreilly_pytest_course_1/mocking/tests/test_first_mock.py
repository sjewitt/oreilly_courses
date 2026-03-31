# from REPL example
# uses @patch decorator to do the assignment: (this is not like the BTED mocks?)

from unittest import mock
import pytest
from src import service

#specify function to mock, an associated patch, in decorator:
# so HERE I am mocking the actual call stack:
# def is_available():
    # checks availability of database
    # print("DB service")
    # return db.check_availability()
    # REMOVING the decorator means we will then call the real thing: 
@mock.patch("src.service.db.check_availability")
def test_first_mock(service_mock):  # this is automatic based on the patch arg.
    print(service_mock)
    service_mock.return_value = True
    # service_mock.return_value = False
    # service.is_available()
    # print(service.is_available())
    # this will always call the mocked service
    assert service.is_available()


    # REMOVING the decorator means we will then call the real thing: 
def test_first_mock_no_mock():  # this is automatic based on the patch arg.
    # will always call the underlying DB method
    assert service.is_available()

# mock the validate_use function:
# note here we are using a pytest feature!
# parameters are an array of tuples, each matching the args.
# with JUST this decorator, we are calling he database method directly:
@pytest.mark.parametrize("uname,pwd",[
    ("aaaa","123"),
    ("bbbb","abcd"),
    ("cccc","456"),
    ("dddd","789"),
    ("eeee","ssss"),
])
def test_first_mock_parameterized_no_mocking(uname, pwd):
    print(service.validate_user(uname,pwd))

# mock the validate_use function:
# note here we are using a pytest feature!
# parameters are an array of tuples, each matching the args.
# with BOTH decorators, we are calling the mocked function instead:
# Don't forget, we are not actually checking the user!!
@mock.patch("src.service.db.get_pwd")
@pytest.mark.parametrize("uname,pwd",[
    ("aaaa","123"),
    ("ZZZZZZZ","abcd"),
    ("cccc","456"),
    ("dddd","789"),
    ("eeee","ssss"),
])
def test_first_mock_parameterized_with_mock(service_mock,uname, pwd):
    print(service_mock)
    # and we substitute a mock for the actual response:
    service_mock.return_value = "abcd"
    assert service.validate_user(uname,pwd)
