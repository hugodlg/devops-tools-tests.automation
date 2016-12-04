#!/usr/bin/python

import json
import re

from itertools import groupby

with open('terraform.tfstate') as tfstate_file:    
    tfstate = json.load(tfstate_file)

modules = tfstate['modules']
resources = sorted(sum(map(lambda m: list(m['resources'].iteritems()), modules), []), key=lambda (x, y): x)
groups = groupby(resources, lambda (k, v): re.search('\\.([\w-]+)', k, re.IGNORECASE).group(1))

print json.dumps(dict([ (k, map(lambda (x,y): y['primary']['attributes']['ipv4_address'], list(v))) for k,v in groups ]))
