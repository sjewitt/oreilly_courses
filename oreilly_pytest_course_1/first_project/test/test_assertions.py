
from first_project.app.first import add

def test_add(a=0,b=0):
    a=1
    b=11
    # if add(20,20) == 40:
    #     print("OK")
    # else:
    #     print("BAD")

    assert add(a,b)==12
    assert add(12,13)==12,"Addition failed."
    # return a+b
