# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2],
         authentication_keys: [:username]

  has_one_attached :profile_image


  validates :email, uniqueness: { case_sensitive: false }, allow_nil: true, allow_blank: true
  validates :nickname, uniqueness: { case_sensitive: false }, allow_nil: true, allow_blank: true

  before_create :set_nickname


  def self.from_omniauth(access_token, provider: "google")
    data = access_token.info
    user = User.find_by(email: data["email"])

    user ||= User.create!(
      email: data["email"],
      password: Devise.friendly_token[0, 20],
      provider:,
    )
    user
  end

  private

  def set_nickname
    self.nickname = SecureRandom.hex(5).to_s
  end
end
