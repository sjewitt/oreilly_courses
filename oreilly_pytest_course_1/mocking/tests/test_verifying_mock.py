# from REPL example
# uses @patch decorator to do the assignment: (this is not like the BTED mocks?)

from unittest import mock
import pytest
from src import service

# #specify function to mock, an associated patch, in decorator:
# # so HERE I am mocking the actual call stack:
# # def is_available():
#     # checks availability of database
#     # print("DB service")
#     # return db.check_availability()
#     # REMOVING the decorator means we will then call the real thing: 
# @mock.patch("src.service.db.check_availability")
# def test_first_mock(service_mock):  # this is automatic based on the patch arg.
#     print(service_mock)
#     service_mock.return_value = True
#     # service_mock.return_value = False
#     # service.is_available()
#     # print(service.is_available())
#     # this will always call the mocked service
#     assert service.is_available()


#     # REMOVING the decorator means we will then call the real thing: 
# def test_first_mock_no_mock():  # this is automatic based on the patch arg.
#     # will always call the underlying DB method
#     assert service.is_available()

# # mock the validate_use function:
# # note here we are using a pytest feature!
# # parameters are an array of tuples, each matching the args.
# # with JUST this decorator, we are calling he database method directly:
# @pytest.mark.parametrize("uname,pwd",[
#     ("aaaa","123"),
#     ("bbbb","abcd"),
#     ("cccc","456"),
#     ("dddd","789"),
#     ("eeee","ssss"),
# ])
# def test_first_mock_parameterized_no_mocking(uname, pwd):
#     print(service.validate_user(uname,pwd))

# # mock the validate_use function:
# # note here we are using a pytest feature!
# # parameters are an array of tuples, each matching the args.
# # with BOTH decorators, we are calling the mocked function instead:
# # Don't forget, we are not actually checking the user!!
# @mock.patch("src.service.db.get_pwd")
# @pytest.mark.parametrize("uname,pwd",[
#     ("aaaa","123"),
#     ("bbbb","abcd"),
#     ("cccc","456"),
#     ("dddd","789"),
#     ("eeee","ssss"),
# ])
# def test_first_mock_parameterized_with_mock(service_mock,uname, pwd):
#     print(service_mock)
#     # and we substitute a mock for the actual response:
#     service_mock.return_value = "abcd"
#     assert service.validate_user(uname,pwd)

#######################################
# part 10:
# These are likely out of context. I suspect they should be called as part of a wider
# testing panel. e.g. I have definitely seen a method being called twice when I did not
# expect that. This kind of test assertion should assist with verifying that a particular
# response (or mock response) is only called/received one time. This does imply CARE in 
# creating the mock object logic.

#######################################
@mock.patch("src.service.db.check_availability")
def test_first_mock_availability_assert_called(first_mock):  # this is automatic based on the patch arg.
    print(first_mock)
    first_mock.return_value = True
    # first_mock.return_value = False
    # service.is_available()
    # if this is commented out, the assert_called(), on the MOCK, will fail
    print(service.is_available())
    # this will always call the mocked service
    # w can see this is called once, but to programmatically verify: - assert_called()
    # i.e. we are checking that the test has actually been run at least once
    first_mock.assert_called()
    # assert service.is_available()

@mock.patch("src.service.db.check_availability")
def test_first_mock_availability_assert_called_once(first_mock):  # this is automatic based on the patch arg.
    print(first_mock)
    first_mock.return_value = True
    # first_mock.return_value = False
    # service.is_available()
    # if this is commented out, the assert_called(), on the MOCK, will fail
    # calling this once passes, and calling it twice FAILS
    # print(service.is_available())
    print(service.is_available())
    # this will always call the mocked service
    # w can see this is called once, but to programmatically verify: - assert_called()
    # i.e. we are checking that the test has actually been run at least once
    first_mock.assert_called_once()
    # assert service.is_available()


@mock.patch("src.service.db.check_availability")
def test_first_mock_availability_assert_not_called(first_mock):  # this is automatic based on the patch arg.
    print(first_mock)
    # first_mock.return_value = True
    first_mock.return_value = False
    # service.is_available()
    # if this is commented out, the assert_called(), on the MOCK, will fail
    # calling this causes failure, and NOT calling it PASSES

    # print(service.is_available())
    # this will always call the mocked service
    # w can see this is called once, but to programmatically verify: - assert_called()
    # i.e. we are checking that the test has actually been run at least once
    first_mock.assert_not_called()
    # assert service.is_available()


# assert_called_with(*args, **kwargs) test
@mock.patch("src.service.db.get_pwd")
@pytest.mark.parametrize("uname,pwd",[
    # ("aaaa","123"),
    ("bbbb","abcd"),
    # ("cccc","456"),
    # ("dddd","789"),
    # ("eeee","ssss"),
])
def test_first_mock_parameterized_validate(second_mock,uname, pwd):
    print(second_mock)
    # and we substitute a mock for the actual response:
    second_mock.return_value = "abcd"
    # assert service.validate_user("bbbb","abcd")
    print(f"VALIDATE USER: {service.validate_user(uname,pwd)}")
    # assert service.validate_user(uname,pwd)
    # second_mock.assert_called_with("bbbbx")
    # test that this mock was called with this argument value:
    second_mock.assert_called_with("bbbb")

# last bit `assert_called_once`
# assert_called_once_with(*args, **kwargs) test
@mock.patch("src.service.db.get_pwd")
@pytest.mark.parametrize("uname,pwd",[
    ("aaaa","123"),
    ("bbcbb","abcd"),
    ("bbbb","abcd"),    # passes OK on this one
    # ("bbcbb","123"),
    # ("dddd","789"),
    # ("eeee","ssss"),
])
def test_first_mock_parameterized_validate_once(second_mock,uname, pwd):
    print("using second mock:")
    print(second_mock)
    # and we substitute a mock for the actual response:
    second_mock.return_value = "abcd"
    # assert service.validate_user("bbbb","abcd")
    # call it twice:
    print(f"VALIDATE USER ONCE: {service.validate_user(uname,pwd)}")
    # print(f"VALIDATE USER ONCE: {service.validate_user(uname,pwd)}")
    # assert service.validate_user(uname,pwd)
    # second_mock.assert_called_with("bbbbx")
    # test that this mock was called with this argument value:
    second_mock.assert_called_once_with("bbbb")

   # he actually simplifis to:
@mock.patch("src.service.db.get_pwd")
def test_first_mock_parameterized_validate_once_course(second_mock):
    second_mock.return_value = "123"
    print(service.validate_user("aaa","123"))
    # print(service.validate_user("aaav","123")) # ARGH!! As soon as I add this, it FAILS (it should not!!)
    # but this doesn't work as expected - it SHOULD pass - because we are only calling 
    # it once **with the specified arg**...
    # second_mock.assert_called_once_with("aaav") # this fails on its own as expected (arg doesnt match)
    second_mock.assert_called_once_with("aaa") # this passes on its own as expected (arg matches)
    # second_mock.assert_called_once() # this will fail if two calls above are made (as expected)
    # it is as if these two assertions are bahaving in the same way...







