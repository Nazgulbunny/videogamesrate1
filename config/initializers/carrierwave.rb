CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      provider:              'AWS', # required
      aws_access_key_id:     Rails.application.secrets.s3_access_key_id, # required
      aws_secret_access_key: Rails.application.secrets.s3_secret_access_key, # required
      region:                'eu-central-1', # optional, defaults to 'us-east-1'
    }
    config.fog_directory  = 'videogamesratedev' # required
    config.fog_public     = true # optional, defaults to true
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
  end
end
