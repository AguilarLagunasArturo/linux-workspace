#!/usr/bin/env python3

import sys
import re
import os

''' 
TODO: ADD IF NECESSARY
        mark1_background #98d3cb
        mark2_background #f2dcd3
        mark3_background #f274bc
'''

schemes_path = os.path.join(os.environ.get('HOME'), '.homemade/color_schemes/')
conf_file = 'kitty.conf'
assossiations = {
    '*.foreground': [
        'cursor', 
        'foreground', 
        'selection_background'
    ],
    '*.background': [
        'cursor_text_color', 
        'background', 
        'selection_foreground'
    ],
    '*.color9': [
        'url_color',
        'bell_border_color'
    ],
    '*.color7': [
        'active_border_color'
    ],
    '*.color15': [
        'inactive_border_color'
    ]
}


if len(sys.argv) != 2:
    print('Usage: {} <xresources-color-scheme>'.format(sys.argv[0]))
    try:
        schemes = os.listdir(schemes_path)
        print('\nColor schemes:')
        [print('\t{}'.format( os.path.join(schemes_path, s) )) for s in schemes]
    except:
        print('Schemes directory does not exists')
    exit()

with open(sys.argv[1], 'r') as f:
    lines = f.read().split('\n')

with open(conf_file, 'r') as f:
    kitty_conf = f.read()

# print(kitty_conf)

for l in lines: # xresourses lines
    ''' colors 0 -> 15 '''
    if re.compile('^\*\.color.* \#\S*$').match(l):
        crg = '^{}'.format(l.split(' ')[0][2:-1])
        for ll in kitty_conf.split('\n'): # kitty lines
            r = re.compile(crg).match(ll)
            if r:
                new = l.replace('.', '').replace('*', '').replace(':', '')
                old = ll
                print('{} -> {}'.format(old, new))
                kitty_conf = kitty_conf.replace(old, new)
                break
    ''' assossiations '''
    for item in assossiations.items():
        crg = '^\{}\{}{}'.format(item[0][0], item[0][1], item[0][2:])
        #print(crg)
        if re.compile(crg).match(l):
            new = l[-7:]
            for destiny in assossiations[item[0]]:
                for ll in kitty_conf.split('\n'): # kitty lines
                    crg1 = '^{}'.format(destiny)
                    crg2 = '#......$'.format(destiny)
                    if re.search(crg1, ll) and re.search(crg1, ll):
                        print('{} -> {}    {}'.format(ll, destiny, new))
                        kitty_conf = kitty_conf.replace(ll, '{}    {}'.format(destiny, new))
                        break

    

with open(conf_file, 'w') as f:
    f.write(kitty_conf)

# cat kitty.conf | grep '.* #\S\{6\}$
