 docker service create \
  --name my-web \
  --publish 8080:80 \
  --replicas 2 \
  nginx
