class AudioUploader < CarrierWave::Uploader::Base

  # storage :file
  storage :fog

  def store_dir
    [
      'uploads',
      Rails.env,
      model.class.to_s.dasherize,
      model.id
    ].compact.join('/')
  end

  def extension_whitelist
    %w(m4a)
  end
end
