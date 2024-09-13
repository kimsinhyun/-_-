# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token, only: :create

    def new
      super
    end

    def sign_in_params
      super
    end
  end
end
