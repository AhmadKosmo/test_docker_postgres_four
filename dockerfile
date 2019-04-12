FROM ruby:2.6.0
MAINTAINER ahmad.moussa@kosmopolead.com

# Install apt based dependencies required to run Rails as
# well as RubyGems. As the Ruby image itself is based on a
# Debian image, we use apt-get to install those.
RUN apt-get update && apt-get install -y build-essential nodejs libpq-dev postgresql-client --fix-missing --no-install-recommends

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN mkdir -p /test_docker_postgres_four
WORKDIR /test_docker_postgres_four

#Initialize the database


# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the main application.
COPY . ./

# Add a script to be executed every time the container starts.
#COPY entrypoint.sh /usr/bin/
#RUN chmod u+x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]


# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000


COPY docker-entrypoint.sh /usr/bin/
RUN chmod u+x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

#CMD ./docker-entrypoint.sh

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
#CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
