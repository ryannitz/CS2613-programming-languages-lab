import imp


import scrape_data


#TODO: Add docstring
def main():
    tag = 'table'
    url = 'https://www.unb.ca/academics/calendar/undergraduate/current/frederictoncourses/softwareengineering/index.html'
    data = scrape_data.get_tagsfrom(tag, url)
    print(data)

if __name__ == '__main__':
    main()
