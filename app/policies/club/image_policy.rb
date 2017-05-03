class Club::ImagePolicy < ApplicationPolicy

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
    (user.clubs.include?(record.club) && user.has_role?(:club_administrator)) || user.has_role?(:franchise_administrator)
  end

  def destroy?
    (user.clubs.include?(record.club) && user.has_role?(:club_administrator)) || user.has_role?(:franchise_administrator)
  end

  def permitted_attributes
    [:file, :club_id]
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
