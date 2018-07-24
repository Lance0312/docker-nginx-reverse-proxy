#!/bin/sh

certbot certonly --standalone -n --agree-tos -m it-tw@verdigris.co --domains app.verdigris.tw 
# Add `--test-cert` back to use Let's Encrypt's staging server when trying to modify, test and play with this server

nginx -g "daemon off;"
