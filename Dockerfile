FROM ruby:3.3.4

# https://github.com/jcupitt/docker-builds/blob/master/ruby-vips-alpine/Dockerfile

# Set the base image to Ruby 3.2.2
RUN apt-get update && apt-get upgrade -y

ARG RAILS_MASTER_KEY


# Install system dependencies
RUN apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    tzdata \
    file \
    ffmpeg \
    nodejs \
    imagemagick \
    libvips42 \
    libvips-dev

# https://matthaliski.com/blog/upgrading-to-rails-7-1-ruby-3-3-and-jemalloc
RUN apt-get install --no-install-recommends -y libjemalloc2
ENV LD_PRELOAD="libjemalloc.so.2" \
    MALLOC_CONF="dirty_decay_ms:1000,narenas:2,background_thread:true"

# Set the working directory in the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install Ruby dependencies
RUN bundle install


# Copy the application code to the container
COPY . .
ENV RAILS_ENV development
ENV RUBY_YJIT_ENABLE=1

RUN rails assets:precompile

# entrypoint 설정
COPY /bin/docker-entrypoint /app/docker-entrypoint
RUN chmod +x /app/docker-entrypoint
ENTRYPOINT ["/app/docker-entrypoint"]

# Expose port 3000 for the Rails application
EXPOSE 3000

# Start the Rails server by default
#ENTRYPOINT ['ruby', 'bin/temp.rb']
CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
