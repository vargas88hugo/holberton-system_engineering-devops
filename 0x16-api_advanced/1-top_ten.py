#!/usr/bin/python3
"""
Program that prints the titles of the first 10 hot posts
"""
import pprint
import requests

URL = 'http://reddit.com/r/{}/hot.json'


def top_ten(subreddit):
    """
    Program that prints the titles of the first 10 hot posts
    """
    headers = {'User-agent': 'Mozilla/5.0'}
    response = requests.get(URL.format(subreddit),
                            headers=headers)
    data = response.json()['data']['children']
    if response.status_code != 200 or not data:
        return print("None")
    for post in data[0:10]:
        print(post['data']['title'])
