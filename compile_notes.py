#!/usr/bin/python

import os
from shutil import copy

chapters = ['01-Basics',
            '02-BornOppenheimer']

root_dir = os.getcwd()

for ch in chapters:
    print(ch)
    os.chdir(ch)
    os.system(f'xelatex {ch}.tex')
    os.system(f'bibtex {ch}.tex')
    os.system(f'xelatex {ch}.tex')
    os.system(f'xelatex {ch}.tex')
    copy(f'{ch}.pdf', f'../pdfs')
    os.chdir(root_dir)
