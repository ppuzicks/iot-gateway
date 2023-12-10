#!/bin/python

import sys
import argparse
import os
from shutil import copyfile
from pathlib import Path


def patch_rename(path:str, dest:str):
  with open(path+'/series.conf', 'r', encoding='utf-8') as f:
    lines = f.readlines()

    count = 1
    for line in lines:
      first_char = line.strip()[:1]
      if first_char == '#' or first_char == '-' or len(first_char) == 0:
        continue

      src_file = line.strip()
      file_name = src_file.split('/')
      
      if file_name[0] != 'patches.armbian':
        continue

      dst_file = '{0:04d}'.format(count) + '_' + file_name[1]
      copyfile(path+'/'+src_file, dest+'/'+dst_file)
      count += 1
  f.close()

if __name__ == "__main__":
  parser = argparse.ArgumentParser()
  parser.add_argument('path', help='conf file path')
  parser.add_argument('dest', help="destination path")
  args = parser.parse_args()

  if not os.path.exists(args.path):
    print('conf directory is not exist')
    raise SystemExit(1)

  if not os.path.exists(args.dest):
    try:
      os.makedirs(args.dest)
    except OSError:
      print('Error')
      raise SystemExit(1)

  patch_rename(args.path, args.dest)

