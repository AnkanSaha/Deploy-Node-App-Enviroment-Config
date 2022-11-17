import os
import time as timer

# Path: auto_Updater.py
time = 3600 # 10 days
def Node_update():
    os.system('sudo npm install -g pm2@latest');
    os.system('sudo pm2 update');
    os.system('sudo npm install -g npm@latest');
    os.system('sudo npm install -g express@@latest');
    os.system('sudo npm install -g helmet@latest');
    os.system('sudo npm install -g body-parser@latest');
    os.system('sudo npm install -g mongoose@latest');
    os.system('sudo npm install -g express-session@latest');
    os.system('sudo npm install -g cookie-parser@latest');
    os.system('sudo npm install -g express-validator@latest');
    os.system('sudo npm install -g express-flash@latest');
    os.system('sudo npm install -g passport@latest');
    os.system('sudo npm install -g passport-local@latest');
    os.system('sudo npm install -g passport-http@latest');
    os.system('sudo npm install -g passport-http-bearer@latest');
    os.system('sudo npm install -g passport-jwt@latest');
    os.system('sudo npm install -g jsonwebtoken@latest');
    os.system('sudo npm install -g bcryptjs@latest');
    os.system('sudo npm install -g nodemailer@latest');
    os.system('sudo npm install -g nodemailer-smtp-transport@latest');
    os.system('sudo npm install -g nodemailer-sendgrid-transport@latest');
    os.system('sudo npm install -g nodemailer-mailgun-transport@latest');
    os.system('sudo npm install -g nodemailer-ses-transport@latest');
    os.system('sudo npm install -g nodemailer-direct-transport@latest');
    os.system('sudo npm install -g nodemailer-stub-transport@latest');
    os.system('sudo npm install -g nodemailer-smtp-pool@latest');
    os.system('sudo npm install -g nodemailer-wellknown@latest');
    os.system('sudo npm install -g nodemailer-mandrill-transport@latest');
    os.system('sudo npm install -g nodemailer-sparkpost-transport@latest');
    os.system('sudo npm install -g nodemailer-postmark-transport@latest');
    os.system('sudo npm install -g cors@latest');
    os.system('sudo npm install -g multer@latest');
    os.system('sudo npm install -g multer-s3@latest');
    os.system('sudo npm install -g unique-random@latest');
    os.system('sudo npm install -g uuid@latest');
    os.system('sudo npm install -g axios@latest');

#loop to run the function every 10 seconds
while True:
    timer.sleep(1)
    time = time - 1
    if time == 0:
        Node_update()
        time = 3600 # 10 days
    else:
        print('Waiting for Update in ' + str(time) + ' Seconds')