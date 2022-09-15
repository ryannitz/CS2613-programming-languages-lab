import colors

def test_correct():
    expected = True
    assert colors.takeStr("yellow") == expected

def test_incorrect():
    expected = False
    assert colors.takeStr("hello") == expected