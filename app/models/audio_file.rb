class AudioFile < ApplicationRecord
  mount_uploader :audio, AudioUploader

  validates :email,
            :audio,
            presence: true
end
