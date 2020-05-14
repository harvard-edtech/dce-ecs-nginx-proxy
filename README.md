# dce-ecs-nginx-proxy
Builds an ssl-enabled nginx reverse proxy docker image. The resulting image is intended to be run as part of an ECS Fargate task.

The image `entrypoint.sh` expects a few environment variables which are used to
populate the `ngnix.conf` file and generate a self-signed SSL cert.

* `APP_HOST` & `APP_PORT` are used to configure what location to proxy. Default is
"localhost" and "3000" respectively.
* `APP_HOST` is also used in the certificate generation.
* `VPC_CIDR` value is used as the `set_real_ip_from` value in `nginx.conf` to tell nginx what addresses are to be trusted to send correct "real" ip values. This should be set to the CIDR block value of the VPC in which both the ECS Cluster and load balancer are presumed to be running.

## Actions

### docker image build

Pushes to `master` will trigger a rebuild of the image and a push to an Amazon ECR repository. This workflow depends on three github Secrets which are assumed to be defined at the organizational level:

* AWS_DEFAULT_REGION
* PUSH_TO_ECR_AWS_ACCESS_KEY_ID
* PUSH_TO_ECR_AWS_SECRET_ACCESS_KEY

The access key and secret should belong to a dedicated IAM user with only the permissions necessary to push to ECR.
