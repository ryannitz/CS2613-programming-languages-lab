courses = {
    'CS1073' : [],
    'CS1303' : [],
    'CS1083' : ['CS1073'],
    'CS2043' : ['CS1073', 'CS1083'],
    'CS2053' : ['CS1073', 'CS1083', 'CS2043'],
    'CS2333' : ['CS1073', 'CS1303'],
}

def get_dependencies(course):
    dependencies = []
    for k,v in courses.items():
        if course in v:
            dependencies.append(k)
    return dependencies

def main():
    for k,v in courses.items():
        print('Courses that depend on', k, ': ', get_dependencies(k))
        # or we can do print(stuff).format(vars)

if __name__ == '__main__':
    main()

