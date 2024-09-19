# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :registerable, :confirmable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_one_attached :profile_image

  validates :email, uniqueness: { case_sensitive: false }, allow_nil: true, allow_blank: true
  validates :nickname, uniqueness: { case_sensitive: false }, allow_nil: true, allow_blank: true

  before_create :set_nickname
  after_create_commit :generate_letter_avatar

  def self.from_omniauth(access_token, provider: "google")
    data = access_token.info
    if (user = User.where(email: data["email"]).first)
      user
    else
      user = User.new(
        email: data.email,
        password: Devise.friendly_token[0, 20],
        provider:,
        confirmed_at: Time.zone.now
      )
      user.save!
      user
    end
  end

  private

  def set_nickname
    self.nickname = "User-#{SecureRandom.hex(5).to_s}"
  end

  def generate_letter_avatar
    return if profile_image.attached?

    LetterAvatarGenerateWorker.perform_async(id)
  end
end
