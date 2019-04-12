#!/bin/bash

# Remove a potentially pre-existing server.pid for Rails.
rm -f /test_docker_postgres_four/tmp/pids/server.pid

# Migrate the database
rake db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
