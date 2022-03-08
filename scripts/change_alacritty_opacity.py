import sys
import re

if len(sys.argv) < 2:
    new = input('new opacity: ')
else:
    new = float(sys.argv[1])

f = open('/Users/kunheeha/.config/alacritty.yml', 'r')

matcher = re.compile(r'''
opacity:\s\d+\.?\d+
''', re.VERBOSE)

fdata = f.read()
match = matcher.search(fdata)
to_replace = match.group(0).strip()
fdata = fdata.replace(to_replace, f'opacity: {new}')
f.close()

f = open('/Users/kunheeha/.config/alacritty.yml', 'w')
f.write(fdata)
f.close()

