inotifywait -q -m -e modify /var/log/user.log |
while read -r filename event; do
  python userLogSendMail.py
done
