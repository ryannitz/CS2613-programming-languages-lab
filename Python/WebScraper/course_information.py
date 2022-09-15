import scrape_data
import re

def get_coursekey(outer_tag):
    inner_tag = outer_tag.find('th', abbr='Course Code')
    return inner_tag.text

def get_coursevalues(outter_tag, abbrs):
    values = [(outter_tag.find('th', abbr=a)).text for a in abbrs]
    return values

def get_courseproperty(outer_tag, property):
    inner_tag = outer_tag.find(property)
    #print(inner_tag)
    return inner_tag.text

def is_coursetag(outer_tag, key):
    inner_tag = get_coursekey(outer_tag)
    return inner_tag == key

def slim_prereq(prereq):
    pattern = '[A-Z]{2,} [0-9]{4}'
    return re.findall(pattern, prereq)

#TODO: Add docstring
def main():
    tag = 'table'
    url = 'https://www.unb.ca/academics/calendar/undergraduate/current/frederictoncourses/softwareengineering/index.html'
    data = scrape_data.get_tagsfrom(tag, url)

    abbrs = ['Course Dscription','Course Credit'] # these values could also be scraped as to not require hardcoded abbrs
    property_tag = 'course_prereq'
    expected_coursetag = 'SWE4203'

    for item in data:
        print(get_coursekey(item), get_coursevalues(item, abbrs), slim_prereq(get_courseproperty(item, property_tag)))


if __name__ == '__main__':
    main()
