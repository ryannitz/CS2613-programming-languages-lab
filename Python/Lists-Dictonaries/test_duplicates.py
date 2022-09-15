import duplicates

def test_duplicate_with_empty():
    list = []
    assert duplicates.contains_duplicates(list) == False

def test_duplicate_with_single_element():
    list = [100]
    assert duplicates.contains_duplicates(list) == False

def test_duplicate_with_no_duplicates():
    list = [100,101,102,103,104]
    assert duplicates.contains_duplicates(list) == False

def test_duplicate_with_adjacent_duplicates():
    list = [100,101,101,103,104]
    assert duplicates.contains_duplicates(list)

def test_duplicate_with_nonadjacent_duplicates():
    list = [100,101,102,102,101]
    assert duplicates.contains_duplicates(list)
