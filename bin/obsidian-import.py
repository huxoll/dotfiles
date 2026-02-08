#!/usr/bin/env python3

from trilium_py.client import ETAPI
import os

server_url = 'http://192.168.86.12:8383/'
token = 'q9EcMJbLdDuS_7l635ZB9sEV9ipawBI4Se+1+gTyMWCqOcRklHhwyYaE='
ea = ETAPI(server_url, token)

#res = ea.search_note(
#  search="python",
#)

#for x in res['results']:
#  print(x['noteId'], x['title'])

current_directory = os.getcwd()

os.chdir("/home/gardnerj/GoogleDrive/Games")

res = ea.upload_md_folder(
  parentNoteId="Gm2eq1tzEclI",
  mdFolder="Huxolls-Vault-Exported",
)

os.chdir("/home/gardnerj/GoogleDrive")

res = ea.upload_md_folder(
  parentNoteId="JpTQxu8OaM58",
  mdFolder="CodeVault-Exported",
)

res = ea.upload_md_folder(
  parentNoteId="7QRmIZli0Oe0",
  mdFolder="Politics-Exported",
)

