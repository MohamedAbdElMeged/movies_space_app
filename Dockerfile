# Use the official Ruby image with the desired version
FROM ruby:3.0.3

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock /app/

# Install gems
RUN bundle install

# Copy the rest of the application code into the container
COPY . /app/

# Precompile assets
RUN rails assets:precompile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]