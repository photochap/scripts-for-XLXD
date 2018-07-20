from datetime import datetime, date, time
import re
import os

theFile = open('/var/log/user.log', 'r')
FILE = theFile.readlines()
theFile.close()
calltxt = ""

# Parse log file
calltxt = "<style> table { border-collapse: collapse; width: 500px; } table, td, th { border: 1px solid black; } </style><html><head><title>Journal du XRF105</title></head><body>Journal du XRF105<hr><table><tr><td>Date</td><td>Call</td><td>Module</td><td>with protocol</td></tr>"

for line in FILE:


   sClt = 0
   
   if int(line.find("Client")) > 0: sClt = int(line.find("Client"))
   if int(line.find("client")) > 0: sClt = int(line.find("client"))
   if sClt > 0:

    #calltxt = calltxt + "<tr><td>" + line[:12] + "</td><td>" + line[int(line.find("client"))+7:int(line.find("client"))+16] + "</td><td>" + line[int(line.find("module")):int(line.find("module"))+9] + "</td></tr>"


    calltxt = calltxt + "<tr><td>" + line[:12] + "</td><td>" + line[sClt+7:sClt+16] + "</td><td>" + line[int(line.find("module")):int(line.find("module"))+8] + "</td><td>" + line[int(line.find("with protocol")):int(line.find("on module"))] + "</td></tr>"





calltxt += "</table></body></html>"





# Send email
os.rename("/var/www/xlx/journal.html", "/var/www/xlx/journal_old.html")
fichier = open("/var/www/xlx/journal.html", "a")
fichier.write("")
fichier.write(calltxt)
fichier.close()
