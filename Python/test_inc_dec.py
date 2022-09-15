import inc_dec

def test_increment_success():
    num = 10
    assert inc_dec.increment(num) == 11

def test_decrement_success():
    num = 10
    assert inc_dec.decrement(num) == 9
