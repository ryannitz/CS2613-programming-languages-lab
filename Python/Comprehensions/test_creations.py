import simple_creations

def test_listofnumbers_success():
    expected = [0,1,2,3,4,5,6,7,8,9]
    assert simple_creations.listofnumbers(0,10) == expected

def test_listofnumbers_same_bounds():
    expected = []
    assert simple_creations.listofnumbers(2,2) == expected

def test_listofnumbers_inverted_bounds():
    expected = []
    assert simple_creations.listofnumbers(3,1) == expected



def test_listofdivisibles_success():
    expected = [0, 2, 4, 6, 8]
    assert simple_creations.listofdivisibles(0,10,2) == expected

def test_listofdivisibles_all_element():
    expected = [0, 1, 2, 3, 4]
    assert simple_creations.listofdivisibles(0,5,1) == expected

def test_listofdivisibles_same_bounds():
    expected = []
    assert simple_creations.listofdivisibles(10,10,2) == expected

def test_listofdivisibles_inverted_bounds():
    expected = []
    assert simple_creations.listofdivisibles(10,5,2) == expected

def test_listofdivisibles_negative_divisor():
    expected = [6,8]
    assert simple_creations.listofdivisibles(5,10,-2) == expected



def test_itemswithtax_success():
    expected = [15, 30]
    before_tax = [10,20]
    assert simple_creations.itemswithtax(before_tax, 0.5) == expected

def test_itemswithtax_zero_tax():
    expected = [10,15,20,21]
    before_tax = [10,15,20,21]
    assert simple_creations.itemswithtax(before_tax, 0.0) == expected

def test_itemswithtax_negative_tax():
    expected = [0.0, 8.5, 17.0, 25.5]
    before_tax = [0, 10,20, 30]
    assert simple_creations.itemswithtax(before_tax, -0.15) == expected
