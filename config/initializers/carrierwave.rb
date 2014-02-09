# CarrierWave.configure do |config|
#   config.fog_credentials = {
#     # Configuration for Amazon S3 should be made available through an Environment variable.
#     # For local installations, export the env variable through the shell OR
#     # if using Passenger, set an Apache environment variable.
#     #
#     # In Heroku, follow http://devcenter.heroku.com/articles/config-vars
#     #
#     # $ heroku config:add S3_KEY=your_s3_access_key S3_SECRET=your_s3_secret S3_REGION=eu-west-1 S3_ASSET_URL=http://assets.example.com/ S3_BUCKET_NAME=s3_bucket/folder

#     # Configuration for Amazon S3
#     :provider              => 'AWS',
#     :aws_access_key_id     => ENV['AKIAJVGSSAVNYCW4CPGA'],
#     :aws_secret_access_key => ENV['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'],
#     :region                => ENV['eu-west-1']
#   }

#   # For testing, upload files to local `tmp` folder.
#   if Rails.env.test? || Rails.env.cucumber?
#     config.storage = :file
#     config.enable_processing = false
#     config.root = "#{Rails.root}/tmp"
#   else
#     config.storage = :fog
#   end

#   config.cache_dir = "#{Rails.root}/tmp/uploads"                  # To let CarrierWave work on heroku

#   config.fog_directory    = ENV['images.siltin']
#   #config.s3_access_policy = :public_read                          # Generate http:// urls. Defaults to :authenticated_read (https://)
#   # config.fog_host         = "#{ENV['images.siltin.s3.amazonaws.com']}/#{ENV['images.siltin']}"
# end

CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAJVGSSAVNYCW4CPGA',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'eu-west-1',                  # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'images.siltin'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end