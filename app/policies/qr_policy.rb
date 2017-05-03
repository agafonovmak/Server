class QrPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    (user.clubs.include?(record.club) && user.has_role?(:club_administrator)) ||
    (user.franchise.clubs.include?(record.club) && user.has_role?(:franchise_administrator))
  end

  def create?
    user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator)
  end

  def update?
    (user.clubs.include?(record.club) && user.has_role?(:club_administrator)) ||
        (user.franchise.clubs.include?(record.club) && user.has_role?(:franchise_administrator))
  end

  def destroy?
    (user.clubs.include?(record.club) && user.has_role?(:club_administrator)) ||
      (user.franchise.clubs.include?(record.club) && user.has_role?(:franchise_administrator))
  end

  def permitted_attributes
    [:name, :description, :charge_count, :user_max_charges, :start_time, :end_time, :template_id]
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
