CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAIZNLS6DOX73ZBY2Q',
    :aws_secret_access_key  => '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',
    # :region => 'us-west-1' -- only if you're not in US Standard
  }       
  if Rails.env.development?
    config.fog_directory = 'fw_app_dev'
  else
    config.fog_directory = 'fw_app'
  end
end