#!/bin/sh

# Add `--test-cert` back to use Let's Encrypt's staging server when trying to modify, test and play with this server
certbot certonly --standalone -n --agree-tos -m it-tw@verdigris.co --domains app.verdigris.tw

nginx -g "daemon off;" &

# Not sure why but the cron job won't run inside docker instance on AWS EC2.
# Instead of trying to run `cron`, just sleep and run `certbot renew`.
while [ true ]; do
    # Sleep for 12 hours
    sleep 43200

    # renew certs
    certbot -q renew --renew-hook "/etc/init.d/nginx reload"
done
