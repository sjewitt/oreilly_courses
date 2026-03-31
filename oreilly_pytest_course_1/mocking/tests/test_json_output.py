from unittest import mock
import pytest
from src import service


####################################
# complex object return testing
# sometimes, we want to return an object (JSON, dict etc.). The above are all boolean
# responses and the last bit is about returning, from the mock, something representative
# of an API response:
# JSON freturn values
# patch the service call to get the password (i.e. Service.validate_user() -> db.get_pwd())
# @mock.patch("src.service.db.get_pwd")
# def test_first_mock_json(third_mock):
#     third_mock.return_value = {}
#     print(service.validate_user("aaa","123"))
#     third_mock.assert_called_once_with("aaa")

# initially, just create a test for the API call. I am calling BTED /sensors
# note this is the same pattern as before - namespace -> funtion call
@mock.patch("src.service.requests.get") #namespace!!
def test_process_sensor_data(mock_requests):
    # update our mock object as declared above with the 
    # JSON return value we expect - note that this is the FULL one liner so it includes the status_code:
    # note the spreat syntax
    mock_requests.return_value = mock.Mock(**{"status_code":200, "json.return_value": [
        {    
            "tri": "dummyXXX",
            "ip": "192.168.1.201",    
            "api": "mock",    
            "location": {      
                "lat": "52.0606",      
                "lon": "-2.0633"    
            },    
            "plugin": None,    
            "version_number": 10,    
            "connection": False,
            "sois": [],    
            "soi_count": 10  
        }
        ]
    })
    # this should now be calling the mock
    output = service.get_user_data()
    print("\nCHECK:")
    print(output)
    print(len(output))
    assert len(output) == 1
    # assert output[0]['tri'] == "dummyXXXY" # will fail because the value is not as expected
    assert output[0]['tri'] == "dummyXXX" # this will pass OK
