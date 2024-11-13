# Set the Ruby version as a build argument
ARG RUBY_VERSION=3.3.4

# Use the official Ruby base image matching the version in your Gemfile
FROM ruby:${RUBY_VERSION}

# Install system dependencies
RUN apt-get update -qq && \
    apt-get install -y build-essential libxml2-dev libxslt1-dev nodejs yarn zlib1g-dev \
    pkg-config libgumbo-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory inside the container
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

# Install the Ruby gems
RUN bundle install

# Copy the entire Rails project into the container
COPY . /myapp

# Precompile assets (optional; can be run at runtime if needed)
RUN bundle exec rails assets:precompile

# Expose port 3000 to the host machine
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
