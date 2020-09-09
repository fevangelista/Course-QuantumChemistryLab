#!/usr/bin/python

import os
from shutil import copy

chapters = ['01-Basics',
            '02-BornOppenheimer',
            '03-Hartree-Fock',
            '04-StationaryPoints']

root_dir = os.getcwd()

for ch in chapters:
    print(ch)
    chapter_dir = os.path.join('src',ch)
    os.chdir(chapter_dir)
    os.system(f'xelatex {ch}.tex')
    os.system(f'bibtex {ch}.tex')
    os.system(f'xelatex {ch}.tex')
    os.system(f'xelatex {ch}.tex')
    copy(f'{ch}.pdf', f'../pdfs')
    os.chdir(root_dir)
