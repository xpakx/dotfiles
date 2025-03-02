import requests
from selectolax.parser import HTMLParser


def scrape_hacker_news():
    url = "https://news.ycombinator.com/"
    response = requests.get(url)
    tree = HTMLParser(response.text)

    for node in tree.css('tr.athing'):
        title_node = node.css_first('td.title a')
        title = title_node.text()
        link = title_node.attributes['href']
        print(f"Title: {title}")
        print(f"URL: {link}")
        print("--------------------")


if __name__ == "__main__":
    scrape_hacker_news()
