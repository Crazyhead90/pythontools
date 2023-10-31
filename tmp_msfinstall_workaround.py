#!/usr/bin/python3
import os

with open('msfinstall') as f:
  msfinstall_lines = f.readlines()

for line in range(len(msfinstall_lines)):
  if msfinstall_lines[line] == '  print_pgp_key | apt-key add -\n':
    msfinstall_lines[line] = '  print_pgp_key | sudo gpg --dearmor -o /usr/share/keyrings/metasploit-framework.gpg\n'
  if msfinstall_lines[line] == '  echo "deb $DOWNLOAD_URI/apt lucid main" > $LIST_FILE\n':
    msfinstall_lines[line] = '  echo "deb [signed-by=/usr/share/keyrings/metasploit-framework.gpg] $DOWNLOAD_URI/apt lucid main" > $LIST_FILE\n'
os.remove('msfinstall')
if os.path.isfile('/usr/share/keyrings/metasploit-framework.gpg')
  os.remove('/usr/share/keyrings/metasploit-framework.gpg')
with open('msfinstall','w') as f:
  for item in msfinstall_lines:
    f.write(f'{item}')
