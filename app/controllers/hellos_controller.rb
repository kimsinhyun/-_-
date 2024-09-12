# frozen_string_literal: true

class HellosController < ApplicationController
  def index
    render "hello/index"
  end
end
