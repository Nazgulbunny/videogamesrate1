class VideoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    process :eager => true
    process :convert => 'mp4'
  end
end
