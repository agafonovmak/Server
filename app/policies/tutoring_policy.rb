class TutoringPolicy < ApplicationPolicy

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
    user.clubs.include?(record.club) && ( user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator) )
  end

  def destroy?
    user == record.user || (user.clubs.include?(record.club)  && ( user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator)))
  end

  def permitted_attributes
    # [:name, :description, :phone, :address, :website_link, :franchise_id, :user_ids]
  end

  class Scope < Scope
    def resolve
      if user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator)
        scope.where(club: user.selected_club)
      else
        scope.where(club.in user.clubs)
      end
    end
  end

end
