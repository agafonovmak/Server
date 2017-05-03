class Qr::TemplatePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    ((user.franchise == record.franchise) && user.has_role?(:club_administrator)) ||
    ((user.franchise == record.franchise) && user.has_role?(:franchise_administrator))
  end

  def create?
    user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator)
  end

  def update?
    ((user.franchise == record.franchise) && user.has_role?(:club_administrator)) ||
    ((user.franchise == record.franchise) && user.has_role?(:franchise_administrator))
  end

  def destroy?
    ((user.franchise == record.franchise) && user.has_role?(:club_administrator)) ||
    ((user.franchise == record.franchise) && user.has_role?(:franchise_administrator))
  end

  def permitted_attributes
    [:name, :description, :score, :cooldown, :franchise_id]
  end

  class Scope < Scope
    def resolve
      scope.where(franchise: user.franchise)
    end
  end

end
