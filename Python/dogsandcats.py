


def main():
    #chewy and nim
    animals = {
        'chewy':'dog',
        'nim':'cat' 
    }
    for k,v in animals.items():
        print(k,v)
    dogs = {("dog" in v) for k,v in animals.item()}

if __name__ == '__main__':
    main()