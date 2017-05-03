class ClubPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.has_role?(:franchise_administrator)
  end

  def update?
    user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator) ||
    user.has_role?(:club_writer)
  end

  def destroy?
    user.has_role?(:franchise_administrator)
  end

  def show_in_main_menu?
    user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator) ||
    user.has_role?(:club_reader) || user.has_role?(:club_writer)
  end

  def permitted_attributes
    [:name, :description, :phone, :address, :website_link,
     :franchise_id, :user_ids, :vk_link, :twitter_link, :facebook_link,
     :instagram_link]
  end

  class Scope < Scope
    def resolve
      if user.has_role? :fitclubs_administrator
        scope
      else
        if user.has_role? :franchise_administrator
          user.franchise.clubs
        else
          user.clubs
        end
      end
    end
  end

end
