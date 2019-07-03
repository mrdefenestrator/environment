#!/usr/bin/env python3
'''Script for accepting newline delimited base64 encoded worklists "uuids"
that decodes them, and returns a deduplicated newline delimited set of the
plan ids inside them
'''
import sys
import base64

lines = sys.stdin.readlines()
decodeds = [base64.decodebytes(_.encode('utf-8')).decode('utf-8') for _ in lines]
ids = [_.split('-')[1] for _ in decodeds]
uniques = set(ids)

for unique in uniques:
    print(unique)
