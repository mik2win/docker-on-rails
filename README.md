# README

production
docker compose -f compose.yaml -p docker-on-rails up


development
RAILS_ENV should be set to development
make sure you sharing ip's w/ web console, make changes to config/environments/development.rb

docker compose -f compose.dev.yaml -p docker-on-rails up
if you need to run in container:
docker run -e --envfile --name app -v .:/app -p 3000:3000 --entrypoint /app/docker-entrypoint.sh docker-on-rails:latest