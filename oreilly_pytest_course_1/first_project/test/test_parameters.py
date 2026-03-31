import sys
import pytest
from first_project.app.first import add,multiply,divide

def test_add():
    assert add(10, 20) == 30
    assert add(100, 200) == 300
    assert add(1000, 2000) == 3000

@pytest.mark.parametrize("output, a, b",[   # define input sequence
    (3,1,2),
    (6,1,5),
    (6,3,3),
    (30,1,29),
    (100,120,-20),
    ],
    ids=["adding stuff","adding more stuff","adding bigger stuff","adding even bigger stuff","adding stuff negatively"]
)
def test_add_params(output, a, b):
    assert add(a,b) == output
0