from bs4 import BeautifulSoup
import requests


def get_tagsfrom(tag, data_url):
    req = requests.get(data_url)
    soup = BeautifulSoup(req.text, "html.parser")
    return soup.find_all(tag)  #returns a list of tags

