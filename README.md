# dce-ecs-nginx-proxy
Builds an ssl-enabled nginx reverse proxy docker image. The resulting image is intended to be run as part of an ECS Fargate task.

The image `entrypoint.sh` expects a few environment variables which are used to
populate the `ngnix.conf` file and generate a self-signed SSL cert.

* `APP_HOST` & `APP_PORT` are used to configure what location to proxy. Default is
"localhost" and "3000" respectively.
* `APP_HOST` is also used in the certificate generation.
* `VPC_CIDR` value is used as the `set_real_ip_from` value in `nginx.conf` to tell nginx what addresses are to be trusted to send correct "real" ip values. This should be set to the CIDR block value of the VPC in which both the ECS Cluster and load balancer are presumed to be running.
