import os
import sys
import re
import json
import tika
from tika import parser

if len(sys.argv) == 1:
    print "You must specify the directory to process"
    os._exit(1)

list_of_files = os.listdir(sys.argv[1])

tika.initVM()

for file in list_of_files:
    if re.match('.*\.pdf|.*\.doc|.*\.docx|.*\.xls|.*\.xlsx|.*\.ppt|.*\.pptx|.*\.mdb', file):
        current_file = os.path.join(sys.argv[1], file)
        sys.stderr.write ("Processing file --> ['" + current_file + "']\n")
        data = parser.from_file(current_file)
        sys.stdout.write (json.dumps(data))
        sys.stdout.write ("\n")
