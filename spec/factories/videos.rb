FactoryGirl.define do
  factory :video do
    name "MyString"
    description "MyText"
    video_file ""
    mp4_file ""
    webm_file ""
    ogg_file ""
    thumbnail ""
    published false
    likes 1
    user nil
  end
end
