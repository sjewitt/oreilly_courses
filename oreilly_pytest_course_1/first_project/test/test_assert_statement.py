# assert syntax: assert <condition>,<optional msg on false>


from first_project.app.first import add

def test_add_number():
    assert add(12,12) == 24
    # assert add(12,13)==12,"Addition failed."

def test_add_strings():
    print("START TEST:")
    # assert add("1", "2") == 3
    # assert add("1", "2") == "3"

    # to test exceptions:
    output = add("str1","str2")
    print(f"output: {output}")

    # why would we want to assert a string here?
    assert type(output) is str

    # and we can do something like 
    assert "str2" in output