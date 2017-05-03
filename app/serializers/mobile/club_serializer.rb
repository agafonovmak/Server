class Mobile::ClubSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :phone, :address, :website_link, :franchise_id, :user_ids, :coach_ids,
             :news_ids, :vk_link, :twitter_link, :facebook_link, :instagram_link

  has_one  :club_shedule, serializer: Mobile::Club::SheduleSerializer
  has_many :club_images,  serializer: Mobile::Club::ImageSerializer
  has_many :training_packages,  serializer: Mobile::TrainingPackageSerializer
end
