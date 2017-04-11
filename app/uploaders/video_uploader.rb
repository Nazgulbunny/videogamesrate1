class VideoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    process :eager => true
    process :convert => 'mp4'
    cloudinary_transformation :quality => 80
  end
end
