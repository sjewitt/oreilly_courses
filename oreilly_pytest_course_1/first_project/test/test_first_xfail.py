import sys
import pytest
from first_project.app.first import add,multiply,divide

# and if the test runner is launched from HERE, we need:
# import pytest

# he used the autocreate test feature in pycharm (which is nice), but I do it manually:
# This is the generated default - so pycharm identified the method in the module (probably because of the dunders)
def test_add():
    print("first test...")
    # interesting! There seemsz to be an implied assert==true here...
    # assert False

def test_add_1():
    assert True

# He again uses the features of pycharm to automatically run the test. So how to run via CLI

# see https://docs.pytest.org/en/stable/how-to/usage.html


# def run_tests():
#     pass # TODO

# if __name__ == "__main__":
#     run_tests()


# embelleshed for part 7
# run with
# pytest test_first.py -vs
@pytest.mark.xfail(reason="optional reason text (can't add up...)")
def test_add_2():
    assert add(10,20) == 40 # !

@pytest.mark.xfail(reason="optional reason text (can't multiply up...)")
def test_multiply():
    assert multiply(10,20) == 200


# conditional xfail
# this is HIS EXAMPLE - I get XPASS if I swap to LT, but if GT, it doesn't hit the condition...
# @pytest.mark.xfail(sys.version_info < (3,11),reason="need more python!"+str(sys.version_info > (3,11)))
# This doesn't fucking work!!
# I get the point though - you can add a programmatic condition
# xpass returns if sys.version_info.minor is indeed GT 9 (e.g) but teh FAIL condition never goes into XFAIL...
# AND he does not actually show the XFAIL state!!!
@pytest.mark.xfail((sys.version_info.minor > 9),reason="need more python!"+str(sys.version_info.minor))
def test_divide():
    print(sys.version_info)
    assert divide(10,4) == 2.5