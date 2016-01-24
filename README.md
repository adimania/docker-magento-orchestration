# docker-magento-orchestration

# License
* Everything in this repo is GPL'ed. 
* Magento uses OSL 3.0

# How to use?
* Modify the run.sh to suit your requirements like database information, admin user etc. 
* Build the docker container usign Dokcerfile
* Mount a shared storage on /var/www/html/, like Gluster or NFS, if you are planning to run this in production

**I will write a docker compose file and kubernetes rc shortly.**
