CarrierWave.configure do |config|

  if Rails.env.test?
    # some test env variables
  else

    config.fog_provider = 'fog/google'                        # required
    config.fog_credentials = {
      provider:                         'Google',
      google_storage_access_key_id:     ENV['GOOGLE_STORAGE_ACCESS_KEY'],
      google_storage_secret_access_key: ENV['GOOGLE_STORAGE_SECRET']
    }

    config.fog_directory = ENV['GOOGLE_CLOUD_STORAGE_BUCKET']
  end
end
