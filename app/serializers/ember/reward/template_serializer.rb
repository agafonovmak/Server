class Ember::Reward::TemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :shared_url, :club_id, :available_rewards_count, :level_cost, :file_url,
             :started_rewards_count, :show_in_app

  def file_url
    if @object.file.file.try(:size).present?
      Rails.application.config.host + @object.file.url
    end
  end

  def available_rewards_count
    if @object.started_rewards_count.present?
      @object.available_rewards_count
    else
      'Неограничено'
    end
  end

end
