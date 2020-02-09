#!/usr/bin/python3
"""
Program that countes the hot titles of Reddit
"""
import pprint
import requests

URL = 'http://reddit.com/r/{}/hot.json'


def recurse(subreddit, hot_list=[], after=None):
    """
    Function that countes the hot titles of Reddit
    """
    headers = {'User-agent': 'Unix:0-subs:v1'}
    params = {'limit': 100}
    if isinstance(after, str):
        if after != "STOP":
            params['after'] = after
        else:
            return hot_list
    response = requests.get(URL.format(subreddit),
                            headers=headers, params=params)
    if response.status_code != 200:
        return None
    data = response.json()['data']
    after = data['after']
    if not after:
        after = "STOP"
    hot_list = hot_list + [post.get('data', {}).get('title')
                           for post in data['children']]
    return recurse(subreddit, hot_list, after)
