# frozen_string_literal: true

class LetterAvatarGenerateWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    return if user.profile_image.attached?

    letter_avatar_path = LetterAvatar.generate(user.nickname, 600)
    blob = ActiveStorage::Blob.create_and_upload!(
      io: File.open(letter_avatar_path, "rb"),
      filename: "avatar_#{user_id}.jpg",
      content_type: "image/jpg"
    )

    user.profile_image.attach(blob)
  end
end
