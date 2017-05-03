class Ember::ClubSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :phone, :address, :website_link, :franchise_id, :user_ids, :coach_ids,
             :news_ids, :club_shedule_id, :card_template_ids, :vk_link, :twitter_link,
             :facebook_link, :instagram_link, :club_image_ids

  def club_shedule_id
    @object.club_shedule.id
  end
end
