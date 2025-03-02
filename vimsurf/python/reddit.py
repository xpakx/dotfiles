import requests
from selectolax.parser import HTMLParser
import argparse


def get_latest_posts(subreddit):
    url = f"https://old.reddit.com/r/{subreddit}/new/"
    response = requests.get(url)

    if response.status_code != 200:
        print("error.")
        return

    tree = HTMLParser(response.text)
    posts = tree.css("div.thing")

    for post in posts:
        title = post.css_first("a.title").text(strip=True)
        link = post.css_first("a.title").attributes['href']
        print(f"Title: {title}")
        print(f"URL: https://reddit.com{link}")
        print("--------------------")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
            description="Fetch the latest posts from a subreddit."
    )
    parser.add_argument(
            "subreddit",
            type=str,
            help="The name of the subreddit to fetch posts from."
    )

    args = parser.parse_args()
    get_latest_posts(args.subreddit)
