class Card::TemplatePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    ((user.clubs.include?(record.club)) && user.has_role?(:club_administrator)) ||
    ((user.franchise.clubs.include?(record.club)) && user.has_role?(:franchise_administrator))
  end

  def create?
    user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator)
  end

  def update?
    ((user.clubs.include?(record.club)) && user.has_role?(:club_administrator)) ||
    ((user.franchise.clubs.include?(record.club)) && user.has_role?(:franchise_administrator))
  end

  def destroy?
    ((user.clubs.include?(record.club)) && user.has_role?(:club_administrator)) ||
    ((user.franchise.clubs.include?(record.club)) && user.has_role?(:franchise_administrator))
  end

  def permitted_attributes
    [:name, :free_freezing_days_count, :club_id, :service_ids, :franchise_id]
  end

  class Scope < Scope
    def resolve
      scope.where(club: user.selected_club)
    end
  end

end
