class CoachPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator)
  end

  def update?
    user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator) ||
    user.has_role?(:workout_writer)
  end

  def destroy?
    user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator) ||
    user.has_role?(:workout_writer)
  end

  def permitted_attributes
    [:name, :share_url, :conducting_personal, :conducting_group, :club_id, :image, :remove_image]
  end

  class Scope < Scope
    def resolve
      unless user.has_role?(:fitclubs_administrator)
        scope.where(club: user.selected_club)
      else
        scope
      end
    end
  end

end
