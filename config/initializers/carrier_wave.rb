CarrierWave.configure do |config|

  if Rails.env.test?
    # some test env variables
  else

    config.fog_provider = 'fog/google'
    config.fog_credentials = {
      provider:                         'Google',
      google_storage_access_key_id:     Rails.application.secrets.google_storage_access_key,
      google_storage_secret_access_key: Rails.application.secrets.google_storage_secret
    }

    config.fog_directory = Rails.application.secrets.google_storage_bucket
  end
end
