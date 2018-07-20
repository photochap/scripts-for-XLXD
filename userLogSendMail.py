from datetime import datetime, date, time
import re
import smtplib

theFile = open('/var/log/user.log', 'r')
FILE = theFile.readlines()
theFile.close()
logltxt = ""
calltxt = ""
mailtxt = ""

def sendMail( mailtxt ):
  "send email"

  SERVER = 'ns0.ovh.net'
  FROM = "no-reply@xrf105.fr"
  TO = ["f4hwb@icloud.com"] # must be a list
  SUBJECT = "XRF105 : User Log"

  # Prepare actual message
  message = """\
From: %s
To: %s
Subject: %s

%s
""" % (FROM, ", ".join(TO), SUBJECT, mailtxt)

  # Send the mail
  send = smtplib.SMTP(SERVER, 587, SERVER)
  send.login('christophe@f4hwb.fr', '240474F1oh')
  send.sendmail(FROM, TO, message)
  send.quit()

  return;


# Parse log file
monthLog = datetime.today().strftime("%B")[:3]
dayLog = datetime.today().day
timeLog = datetime.today().time().hour
mnLog = datetime.today().time().minute - 5

for line in FILE:

  if line[:3] == monthLog and int(line[4:6]) == dayLog and int(line[7:9]) == timeLog and int(line[10:12]) >= mnLog:
    
   sClt = 0
   
   logltxt = logltxt + line
   
   if int(line.find("Client")) > 0: sClt = int(line.find("Client"))
   if int(line.find("client")) > 0: sClt = int(line.find("client"))
   if sClt > 0:
    #print line
    calltxt = calltxt + line[:12] + " - " + line[sClt+7:sClt+16] + " sur le " + line[int(line.find("module")):int(line.find("module"))+8] + " " + line[int(line.find("with protocol")):int(line.find("on module"))]
   
   mailtxt = calltxt + "\n\n\n\n\n" + logltxt
   
# Send email
#  sendMail(mailtxt)
