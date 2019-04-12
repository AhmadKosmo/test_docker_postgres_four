#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /test_docker_postgres_four/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
