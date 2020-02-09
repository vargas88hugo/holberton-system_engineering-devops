#!/usr/bin/python3
"""
Program that return the number of subscribers from Reddit
"""
import requests


BASE_URL = 'http://reddit.com/r/{}/about.json'


def number_of_subscribers(subreddit):
    """
    Function that return the number of subscribers from Reddit
    """
    headers = {'User-agent': 'Mozilla/5.0'}
    response = requests.get(BASE_URL.format(subreddit),
                            headers=headers)
    if response.status_code != 200:
        return 0
    return response.json()['data']['subscribers']
