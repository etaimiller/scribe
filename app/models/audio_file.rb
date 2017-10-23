class AudioFile < ApplicationRecord
  mount_uploader :audio, AudioUploader

  before_save :update_audio_file_size

  validates :email,
            :audio,
            presence: true

  def update_audio_file_size
    if audio.present? && audio_changed?
      self.file_size = audio.file.size
    end
  end
end
