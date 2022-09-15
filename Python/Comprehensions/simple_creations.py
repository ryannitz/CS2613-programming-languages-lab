def listofnumbers(a,b):
    return list(range(a,b))

def listofdivisibles(a,b,d):
    return [elem for elem in listofnumbers(a,b) if (elem % d == 0) ]

def itemswithtax(before_tax, tax):
    print(tax+1)
    return [round((elem * (tax + 1)), 2) for elem in before_tax]

def main():
    print(listofnumbers(0,10))
    print(listofdivisibles(0,10,2)) 
    before_tax = [10.0, 15.0, 20.0, 13.99, 5.50]
    print(itemswithtax(before_tax, 0.15))

if __name__ == '__main__':
    main()