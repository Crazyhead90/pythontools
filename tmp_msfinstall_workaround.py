#!/usr/bin/python3
with open('msfinstall') as f:
  msfinstall_lines = f.readlines()

for line in range(len(msfinstall_lines)):
  if msfinstall_lines[line] == '  print_pgp_key | apt-key add -':
    msfinstall_lines[line] = '  print_pgp_key | sudo gpg --dearmor -o /usr/share/keyrings/metasploit-framework.gpg'
  if msfinstall_lines[line] == '  echo "deb $DOWNLOAD_URI/apt lucid main" > $LIST_FILE':
    msfinstall_lines[line] = '  echo "deb [signed-by=/usr/share/keyrings/metasploit-framework.gpg] $DOWNLOAD_URI/apt lucid main" > $LIST_FILE'
