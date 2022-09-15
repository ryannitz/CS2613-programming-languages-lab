def contains_duplicates(list):
    return len(set(list)) != len(list)

def main():
    my_list = list(range(1, 101))
    my_list.extend([120,110,100])
    print(contains_duplicates(my_list))

if __name__ == '__main__':
    main()

