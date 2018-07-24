# docker-nginx-reverse-proxy

Image for running nginx reverse proxy server to bypass China's geate firewall for Verdigris's sites on AWS EC2 instance.

## Usage

### Build and Push
Build image with
```
make build
```

Push to Docker Hub with
```
make push
```

### Deployment
Start the docker instance with the following command
```
docker run -d --name nginx-reverse-proxy -p 80:80 -p 443:443 -v letsencrypt:/etc/letsencrypt verdigristech/nginx-reverse-proxy
```

## Important Notes when trying to test this server
As Let's Encrypt has rate limit for their production server. When trying to modify and play with this server. Add `--test-cert` option back at the end of the `certbot` command inside `scripts/start.sh` file.

---

Copyright © 2018 Verdigris Technologies Inc. All rights reserved.