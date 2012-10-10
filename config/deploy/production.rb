# Production server configuration
# Deploy by command: cap production deploy
# 50.63.3.253 = god03maj
role :web, '50.63.3.253'
role :app, '50.63.3.253'
role :db, '50.63.3.253' , :primary => true
