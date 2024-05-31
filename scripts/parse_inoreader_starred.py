#!/usr/bin/env python3

import json
import requests
import re

inoreader_data = open('starred.json', mode='r')
json_data = json.load(inoreader_data)

for starred_item in json_data['items']:
    if len(starred_item['canonical']) == 1:
        
        item_title = starred_item['title']
        item_url = starred_item['canonical'][0]['href']

        pattern = '10.\d{4,9}/[-._;()/:A-Za-z0-9]+'
        item_doi = re.findall(pattern, item_url)

        if item_doi:
            item_id = item_doi[0]
        elif re.search('ArticleLanding', item_url):
            item_id = f"10.1039/{item_url.split('/')[-1]}"
        elif re.search('nature.com', item_url):
            item_id = f"10.1038/{item_url.split('/')[-1]}"
        else:
            item_id = item_url

        print(f"{item_title[:80]}|{item_url}|{item_id}")

inoreader_data.close()
