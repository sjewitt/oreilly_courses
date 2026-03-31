# part 1:
 - python install - doh!!
 - he uses pycharm but WTF...
 why waste time describing installation! It's a pytest course so the assumption should be that the pre-reqs of python and IDE are already installed!!!!

 - IDE install - doh!! (IDLE = indtegrated dev and LEARNING environment)
 
# part 2:
 - pycharm install/configure.. Ugh!

## Unit testing intro: FINALLY!

 - specific bit, rather than E2E testing.
 - he defines "unit" as the atomic level piece of code etc. that should be tested (i.e. if testing a function, you don't need to test internals of that function (in fact, the details inside may change anyway...))
 - identify bugs early
 - cost reduction(?) or - easier dev flow...
 - code quality improves (makes developer think! -> better code)
 - improved debugging

he notes that pytest is predominantly used for API esting, but can of course be used for other code tests

 - it's FOSS!!
 - simplicity
 - parallel tests
 - configurable testing runs

## vs integration testing
 - how is this different to E2E? REALLY CRAPPY description!

# part 3:

## install/intro to pytest

 he IS using a VENV, but doesnt say so - this can lead to confusion if the student doesn't have a VENV set up, and the pip install bit will install pytest GLOBALLY!! WTF is the fix button???

 # part 4

 he spends a lot of time explainng how to use pycharm specifically. 
 
 TODO: gather the notes I made on setting up VS Code for:

  - running a venv
    - https://code.visualstudio.com/docs/python/environments - this works, but is flaky as fuck

  - running the tests
    - https://code.visualstudio.com/docs/python/testing - this was key!!!
    - https://github.com/microsoft/vscode-dotnettools/issues/1620
    - https://docs.pytest.org/en/stable/how-to/usage.html

## verbose output - just append `-v`...

`$ pytest -v`

# part 5

## Assertions
 -some test code
 - explains why if/else wont work (true in eitehr case??)
 he doesn't actually explain WHY if/else will always pass...

  - `assert` statement

  printing to console!!:
   - https://stackoverflow.com/questions/24617397/how-do-i-print-to-console-in-pytest

`$ pytest test_assert_statement.py::test_add_strings -vs`

 - assert with strings and numbers (the `add()` method can e used for both of couse)

### assert exceptions:

 - pytest.raises([exception class])

# part 6

 - setup/teardown

 - fixtures - related to setup, but can be applied on an individual basis (deargs to other fixtures)

 - fixtures and `yeald`
essentially, you can `yeald` teardown code...

# part 7: markers

many tests... run a subset of tests.
 - categorise tests, and flag pytest to run categories:

 marker decorator - REALLY should focus on the CLI switches for this!!
 need `-m [markername]`

 see also:
 https://stackoverflow.com/questions/60806473/pytestunknownmarkwarning-unknown-pytest-mark-xxx-is-this-a-typo

and 

https://docs.pytest.org/en/stable/how-to/mark.html


 ## expected failures:

`xfail` and `skip`
 - allows to mark tests that are e.g. have WIP actual code and/or will be expected to fila under certain scenarios
 ### xfail
  - won't be considered in the eesults evenn if it DOES fail (e.g. the unbderlying app code is not completed, or is system dependent and will fail in the dev envirinment etc.). But it does still run

### skip
the so-marked test will not run at all


# part 8: parameterized testing

## input params for tests
parameterised markers:

see code

# part 9: Mocking

unit tests should not be dependent on external factors (database, MQTT or whatever). therefore a fake interface is needed to simulate e.g. the database:

 - not dependent on ext services
 - removes depencencies
 - time saving potentially
 - control over simulated behaviour of external services

 mocking example

 See code, and:

 he uses console and shows how to use `unittest.mock`:

PYTHON CONSOLE:
 (first_project) sjewitt@sjewitt-Precision-3550:~/dev/oreilly_courses/oreilly_pytest_course_1/first_project/test$ python
Python 3.10.12 (main, Mar  3 2026, 11:56:32) [GCC 11.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
Ctrl click to launch VS Code Native REPL
>>> from unittest import mock
>>> first_mock = mock.Mock()
>>> first_mock
<Mock id='134254345937456'>
>>> first_mock()
<Mock name='mock()' id='134254345914880'>
>>> first_mock = mock.Mock("first mock")
>>> first_mock()
<Mock name='mock()' id='134254341898688'>
>>> first_mock
<Mock spec='str' id='134254341901328'>
>>> first_mock.name
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/usr/lib/python3.10/unittest/mock.py", line 643, in __getattr__
    raise AttributeError("Mock object has no attribute %r" % name)
AttributeError: Mock object has no attribute 'name'
>>> first_mock = mock.Mock(name="first mock")
>>> first_mock.name
<Mock name='first mock.name' id='134254343434208'>
>>> first_mock
<Mock name='first mock' id='134254343728736'>
>>> first_mock['name]
  File "<stdin>", line 1
    first_mock['name]
               ^
SyntaxError: unterminated string literal (detected at line 1)
>>> first_mock['name']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'Mock' object is not subscriptable
>>> first_mock()
<Mock name='first mock()' id='134254345714512'>
>>> first_mock = mock.Mock(name="first mock", return_value=False)
>>> first_mock()
False
>>> first_mock
<Mock name='first mock' id='134254341899552'>
>>> second_mock = mock.Mock(name="second mock", return_value={"name":"fish"})
>>> second_mock()
{'name': 'fish'}
>>> # create a mock of DB availability:
>>> mocking.src.db.check_availability = 
KeyboardInterrupt
>>> mocking.src.db.check_availability = mock.Mock(name="db_availability", return_value=False)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'mocking' is not defined
>>> import mocking.src.db
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ModuleNotFoundError: No module named 'mocking'
>>> pwd()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'pwd' is not defined
>>> exit()
(first_project) sjewitt@sjewitt-Precision-3550:~/dev/oreilly_courses/oreilly_pytest_course_1/first_project/test$ cd ../..
(first_project) sjewitt@sjewitt-Precision-3550:~/dev/oreilly_courses/oreilly_pytest_course_1$ ls
9781807608231_Code.zip  first_project  mocking  README.md
(first_project) sjewitt@sjewitt-Precision-3550:~/dev/oreilly_courses/oreilly_pytest_course_1$ cd mocking/
(first_project) sjewitt@sjewitt-Precision-3550:~/dev/oreilly_courses/oreilly_pytest_course_1/mocking$ python
Python 3.10.12 (main, Mar  3 2026, 11:56:32) [GCC 11.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
Ctrl click to launch VS Code Native REPL
>>> import mocking.src.db
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ModuleNotFoundError: No module named 'mocking'
>>> exit()
(first_project) sjewitt@sjewitt-Precision-3550:~/dev/oreilly_courses/oreilly_pytest_course_1/mocking$ cd ..
(first_project) sjewitt@sjewitt-Precision-3550:~/dev/oreilly_courses/oreilly_pytest_course_1$ python
Python 3.10.12 (main, Mar  3 2026, 11:56:32) [GCC 11.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
Ctrl click to launch VS Code Native REPL
>>> import mocking.src.db
>>> import mocking.src.db as db
>>> db.check_availability()
caling DB back end to determine availability
True
>>> 

and HERE he assigns the imported function (NOT the call itself!) to a unittest mock

[back to REPL]:

>>> import mocking.src.db
>>> import mocking.src.db as db
>>> db.check_availability()
caling DB back end to determine availability
True
>>> from unittest import mock
>>> first_mock = mock.Mock(name="first mock", return_value=False)
>>> db.check_availability = first_mock
>>> db.check_availability()
False


See example code - the definition of the mocked thing has a very counter-intuitive syntax - it seems to be 
`module.name.space.called.function.name.space`


## parameterised mocking

see code.

# part 10 advanced mocking and patterns

## verifying mocks

He doesn't describe use-cases, so this needs further research...

 - assert_called() - verifies the mock is called at least once (see code)
 - assert_called_once() - verifies the mock is called at once only (see code)
 - assert_not_called()
 - assert_called_with(*args, **kwargs)
 - assert_called_once_with(*args, **kwargs)

 hmm... With parameterised > 1 values, even with assert_called_once_with, we get a PASS. WTF?

## THIS PASSES:
```
@mock.patch("src.service.db.get_pwd")
@pytest.mark.parametrize("uname,pwd",[
    ("bbbb","abcd"),
    ("bbbb","abcd"),
])
def test_first_mock_parameterized_validate_once(second_mock,uname, pwd):
    second_mock.return_value = "abcd"
    print(f"VALIDATE USER ONCE: {service.validate_user(uname,pwd)}")
    second_mock.assert_called_once_with("bbbb")
```

## This fails (correctly) because the arg is different:

```
@mock.patch("src.service.db.get_pwd")
@pytest.mark.parametrize("uname,pwd",[
    ("bbbb","abcd"),
    ("bbcbb","123"),
])
def test_first_mock_parameterized_validate_once(second_mock,uname, pwd):
    second_mock.return_value = "abcd"
    print(f"VALIDATE USER ONCE: {service.validate_user(uname,pwd)}")
    second_mock.assert_called_once_with("bbbb") # it is called once only with this arg value
```


## But this FAILS as expected:
The ARG value is the same.

```
@mock.patch("src.service.db.get_pwd")
@pytest.mark.parametrize("uname,pwd",[
    ("bbbb","abcd"),
    ("bbbb","abcd"),
])
def test_first_mock_parameterized_validate_once(second_mock,uname, pwd):
    second_mock.return_value = "abcd"
    # call it twice:
    print(f"VALIDATE USER ONCE: {service.validate_user(uname,pwd)}")
    print(f"VALIDATE USER ONCE: {service.validate_user(uname,pwd)}")
    second_mock.assert_called_once_with("bbbb")
```

# mocking JSON return values

He makes some changes to the project (I'll add new methods)

db - unchanged
service - some added methods:


he calls this endpoint:

https://mocki.io/v1/a68af8ae-48e7-4f19-b4dc-b7a6dc7feae2

which FAILS as I guess it's HIS...

Using BTED API instead:
http://localhost:5005/sensors/?exclude_sois=true

```python
[
  {
    "tri": "mock_test_1",
    "ip": "192.168.1.200",
    "api": "mock",
    "location": {
      "lat": "52.0606",
      "lon": "-2.0633"
    },
    "plugin": null,
    "version_number": 10,
    "connection": false,
    "sois": [],
    "soi_count": 10
  },
  {
    "tri": "mock_test_2",
    "ip": "192.168.1.201",
    "api": "mock",
    "location": {
      "lat": "52.0606",
      "lon": "-2.0633"
    },
    "plugin": null,
    "version_number": 10,
    "connection": false,
    "sois": [],
    "soi_count": 10
  }
]
```


and dummy data:
```python
[
  {
    "tri": "dummy",
    "ip": "192.168.1.201",
    "api": "mock",
    "location": {
      "lat": "52.0606",
      "lon": "-2.0633"
    },
    "plugin": null,
    "version_number": 10,
    "connection": false,
    "sois": [],
    "soi_count": 10
  }
]
```

terminal tests:

```terminal
$ python
Python 3.10.12 (main, Mar  3 2026, 11:56:32) [GCC 11.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
Ctrl click to launch VS Code Native REPL
>>> from unittest import mock
>>> # create a mock
>>> first_mock = mock.Mock()
>>> first_mock()
<Mock name='mock()' id='134716399864272'>
>>> first_mock.json.return_value = [  {    "tri": "dummy",    "ip": "192.168.1.201",    "api": "mock",    "location": {      "lat": "52.0606",      "lon": "-2.0633"    },    "plugin": null,    "version_number": 10,    "connection": false,    "sois": [],    "soi_count": 10  }]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'null' is not defined
>>> first_mock.json.return_value = [  {    "tri": "dummy",    "ip": "192.168.1.201",    "api": "mock",    "location": {      "lat": "52.0606",      "lon": "-2.0633"    },    "plugin": None,    "version_number": 10,    "connection": false,    "sois": [],    "soi_count": 10  
}]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'false' is not defined. Did you mean: 'False'?
>>> first_mock.json.return_value = [  {    "tri": "dummy",    "ip": "192.168.1.201",    "api": "mock",    "location": {      "lat": "52.0606",      "lon": "-2.0633"    },    "plugin": None,    "version_number": 10,    "connection": False,    "sois": [],    "soi_count": 10  
}]
>>> # note the .json. namespace
>>> first_mock.json()
[{'tri': 'dummy', 'ip': '192.168.1.201', 'api': 'mock', 'location': {'lat': '52.0606', 'lon': '-2.0633'}, 'plugin': None, 'version_number': 10, 'connection': False, 'sois': [], 'soi_count': 10}]
>>> # we also need a status_code...
>>> first_mock.status_code = 200
>>> first_mock()
<Mock name='mock()' id='134716399864272'>
>>> first_mock.status_code
200
>>> # or, as a one-liner:
>>> second_mock = mock.Mock(**{"status_code":200, "json.return_value": [  {    "tri": "dummy",    "ip": "192.168.1.201",    "api": "mock",    "location": {      "lat": "52.0606",      "lon": "-2.0633"    },    "plugin": None,    "version_number": 10,    "connection": False,
    "sois": [],    "soi_count": 10  }]})
>>> second_mock.json()
[{'tri': 'dummy', 'ip': '192.168.1.201', 'api': 'mock', 'location': {'lat': '52.0606', 'lon': '-2.0633'}, 'plugin': None, 'version_number': 10, 'connection': False, 'sois': [], 'soi_count': 10}]
>>> # assign the mock to a get request:
>>> mock_get_request = mock.Mock(return_value=second_mock)
>>> mock_get_request()
<Mock id='134716395506656'>
>>> mock_get_request().status_code
200
>>> mock_get_request().json()
[{'tri': 'dummy', 'ip': '192.168.1.201', 'api': 'mock', 'location': {'lat': '52.0606', 'lon': '-2.0633'}, 'plugin': None, 'version_number': 10, 'connection': False, 'sois': [], 'soi_count': 10}]
>>> 
```

# REFS:
 - https://dag7.it/appunti/dev/Pytest/What-Are-Pytest-Mock-Assert-Called-Methods-and-How-To-Leverage-Them
 - https://stackoverflow.com/questions/42297549/magic-mock-assert-called-once-vs-assert-called-once-with-weird-behaviour
 - https://docs.python.org/3/library/unittest.mock.html
 - https://stackoverflow.com/questions/34833327/how-to-test-single-file-under-pytest - e.g.: `pytest test_verifying_mock.py::test_json_putput -sv`
 - https://docs.pytest.org/en/stable/how-to/mark.html
 - https://stackoverflow.com/questions/60806473/pytestunknownmarkwarning-unknown-pytest-mark-xxx-is-this-a-typo - unknown marker warning
 - https://stackoverflow.com/questions/24617397/how-do-i-print-to-console-in-pytest - e.g.: `pytest -s`
 - 


# OTHER
$ pytest test_verifying_mock.py -sv

need to be IN the directory, or specify the path to the test dir