# frozen_string_literal: true

module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    skip_before_action :verify_authenticity_token

    def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        flash.notice = 'Signed in!'
        sign_in_and_redirect @user
      else
        flash.notice = "We couldn't sign you in because: #{@user.errors.full_messages.to_sentence}"
        redirect_to new_user_session_url
      end
    end

    protected

    def after_omniauth_failure_path_for(scope)
      new_user_session_path
    end

    def after_sign_in_path_for(resource)
      root_path
    end
  end
end
