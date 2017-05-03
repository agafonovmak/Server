class Ember::UserSerializer < ActiveModel::Serializer
  attributes :id, :name,  :email, :mobile, :club_ids, :franchise_id, :tutoring_ids, :is_admin, :is_owner,
             :ticket_recall_ids, :ticket_freezing_ids, :ticket_extension_ids, :ticket_message_ids,
             :selected_club_id, :is_admin_or_owner, :roles_list, :user_type_id, :password, :age
  def is_owner
    @object.is_owner
  end

  def is_admin
    @object.is_admin
  end

  def is_admin_or_owner
    @object.is_owner || @object.is_admin
  end

  def roles_list
    @object.current_roles_list.select(&:present?)
  end

end
