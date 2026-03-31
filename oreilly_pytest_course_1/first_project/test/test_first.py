from first_project.app.first import add,multiply,divide
import pytest

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
@pytest.mark.example
def test_add_2():
    assert add(10,20) == 30

@pytest.mark.example
def test_multiply():
    assert multiply(10,20) == 200

@pytest.mark.other
def test_divide():
    assert divide(10,4) == 2.5