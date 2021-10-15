#!/usr/bin/env python3
import requests
import sys

lastprice = requests.get('https://www.bitstamp.net/api/ticker/').json()['last']
lastprice = float(lastprice)
sys.stdout.write('􀗕 {:,.2f}'.format(lastprice))
