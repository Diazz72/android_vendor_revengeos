import json 
import time
import sys

device = sys.argv[1]
zipvar = sys.argv[2]
version = sys.argv[3]
size = sys.argv[4]
md5 = sys.argv[5]

while True:
	try:
		donate_url = str(input("Enter donate url, leave blank for default: "))
		news_url = str(input("Enter channel url, leave blank for default: "))
		if not donate_url.isalpha() or not donate_url.isalpha():
			raise ValueError
	except ValueError:
		print("Sorry, I didn't understand that, please enter a valid string")
		continue
	else:
		break

if not donate_url:
	donate_url = "PayPal.me/lucchetto"

if not news_url:
	news_url = "https://t.me/RevengeOSNews"

# Data to be written 
dictionary ={ 
	"error": False,
	"donate_url": donate_url,
	"website_url": "https://revengeos.com/",
	"news_url": news_url,
	"datetime": time.time(),
	"filename": zipvar,
	"id": "",
	"size": size,
	"url": "https://gensho.ftp.acc.umu.se/mirror/osdn.net/storage/g/r/re/revengeos/" + device + "/" + zipvar,
	"version": version,
	"filehash": md5
} 
  
# Serializing json  
json_object = json.dumps(dictionary, indent = 4) 
  
# Writing to device.json 
with open("device.json", "w") as outfile: 
    outfile.write(json_object) 