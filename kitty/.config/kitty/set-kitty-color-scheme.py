#!/usr/bin/env python3
import sys
import re
import os

schemes_path = os.path.join(os.environ.get('HOME'), '.config/xresources/color-schemes/')
conf_file = os.path.join(os.environ.get('HOME'), '.config/kitty/kitty.conf')

'''
TODO: ADD IF NECESSARY
        mark1_background #98d3cb
        mark2_background #f2dcd3
        mark3_background #f274bc
'''

associations = {
    '*.foreground': [
        'foreground',
        'cursor',
        'selection_background'
    ],
    '*.background': [
        'background',
        'cursor_text_color',
        'selection_foreground'
    ],
    '*.color0': ['color0'],
    '*.color1': ['color1'],
    '*.color2': ['color2'],
    '*.color3': ['color3'],
    '*.color4': ['color4'],
    '*.color5': ['color5'],
    '*.color6': ['color6'],
    '*.color7': [
        'color7',
        'active_border_color'
    ],
    '*.color8': ['color8'],
    '*.color9': [
        'color9',
        'url_color',
        'bell_border_color'
    ],
    '*.color10': ['color10'],
    '*.color11': ['color11'],
    '*.color12': ['color12'],
    '*.color13': ['color13'],
    '*.color14': ['color14'],
    '*.color15': [
        'color15',
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
    xresources = f.read()

with open(conf_file, 'r') as f:
    kitty_conf = f.read()

''' associations '''
for item in associations.items():
    for l in xresources.split('\n'): # xresourses lines
        crg = '^\{}\{}{}:'.format(item[0][0], item[0][1], item[0][2:])
        if re.compile(crg).match(l):
            new = l[-7:]
            for destiny in associations[item[0]]:
                for ll in kitty_conf.split('\n'): # kitty lines
                    crg1 = '^{}'.format(destiny)
                    crg2 = '#......$'
                    if re.search(crg1, ll) and re.search(crg2, ll):
                        kitty_conf = kitty_conf.replace(ll, '{}    {}'.format(destiny, new))
                        break

print('Kitty color scheme: {}'.format( os.path.split(sys.argv[1])[1] ))
with open(conf_file, 'w') as f:
    f.write(kitty_conf)
