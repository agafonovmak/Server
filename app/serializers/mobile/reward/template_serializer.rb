class Mobile::Reward::TemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :shared_url, :club_id, :available_rewards_count, :level_cost, :file_url,
             :thumb_url, :show_in_app

  def file_url
    if @object.file.file.try(:size).present?
      @object.file.url
    else
      'default.png'
    end
  end

  def thumb_url
    if @object.file.file.try(:size).present?
      @object.file.url(:thumb)
    else
      'default.png'
    end
  end

  def available_rewards_count
    @object.available_rewards_count
  end

end
