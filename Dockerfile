# Use a base Ruby image (you can choose the version that matches your project)
FROM ruby:2.7.1

# Set the working directory inside the container
WORKDIR /app

# Install system dependencies
RUN apt-get update -y && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs

# Install Ruby gems
COPY Gemfile Gemfile.lock ./
# RUN gem install bundler
RUN bundle install

# Copy the rest of the application files
COPY . .

# Expose the port on which your Rails app will run
EXPOSE 3000


# ENTRYPOINT ["/app/docker-entrypoint.sh"]

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]