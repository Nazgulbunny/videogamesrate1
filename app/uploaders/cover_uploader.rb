class CoverUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :standard do
    process :eager => true
    process :resize_to_fill => [1140, 400]
    process :convert => 'jpg'
    cloudinary_transformation :quality => 80
  end
end
