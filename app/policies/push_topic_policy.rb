class PushTopicPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.has_role?(:super_administrator)
  end

  def update?
    user.has_role?(:super_administrator)
  end

  def destroy
    user.has_role?(:super_administrator)
  end

  def permitted_attributes
    # [:name, :description, :phone, :address, :website_link, :franchise_id, :user_ids]
  end

  class Scope < Scope
    def resolve
      if user.has_role? :franchise_administrator
        scope.where(club.in user.franchise.clubs)
      else
        if user.has_role? :club_administrator
          scope.where(club.in user.clubs)
        else
          scope.where(club.in user.clubs)
        end
      end
    end
  end

end
