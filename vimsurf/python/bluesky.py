import requests
import argparse


def scrape_user_timeline(did):
    url = f"https://public.api.bsky.app/xrpc/app.bsky.feed.getAuthorFeed?actor={did}"
    response = requests.get(url).json()

    posts = response["feed"]
    for entry in posts:
        post = entry["post"]
        author = post["author"]["displayName"]
        authorHandle = post["author"]["handle"]
        date = post["record"]["createdAt"]
        content = post["record"]["text"]
        replies = post["replyCount"]

        print(f"# {author} @{authorHandle} [{date}]")
        print(content)
        if replies > 0:
            print(f"({replies} replies)")

        embed = post['embed'] if 'embed' in post else {}
        embed_type = embed.get("$type", "")

        if embed_type in ["app.bsky.embed.external", "app.bsky.embed.external#view"]:
            ext = embed['external']
            desc = ext['description']
            title = ext['title']
            uri = ext['uri']
            print(f"\n### {title}")
            print(desc)
            print(f"LINK: {uri}")

        record = post['record']
        facets = record['facets'] if 'facets' in record else []
        for facet in facets:
            features = facet['features']
            for feature in features:
                if feature['$type'] == 'app.bsky.richtext.facet#link':
                    uri = feature['uri']
                    print(f"\n{uri}")
        print()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
            description="Fetch the latest posts from a bluesky."
    )
    parser.add_argument(
            "did",
            type=str,
            help="The id of the profile to fetch posts from."
    )

    args = parser.parse_args()
    scrape_user_timeline(args.did)
