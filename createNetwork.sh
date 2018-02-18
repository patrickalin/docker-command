echo "Create my network for the traefik"
docker network create --attachable --driver overlay traefik-net
