class ScoreRulePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    (user.franchise == record.franchise) && user.has_role?(:franchise_administrator)
  end

  def create?
    user.has_role?(:franchise_administrator)
  end

  def update?
    (user.franchise == record.franchise) && user.has_role?(:franchise_administrator)
  end

  def destroy?
    (user.franchise == record.franchise) && user.has_role?(:franchise_administrator)
  end

  def permitted_attributes
    [:name, :description, :score, :franchise_id]
  end

  class Scope < Scope
    def resolve
      if user.has_role? :franchise_administrator
        scope.where(franchise: user.franchise)
      else
        scope
      end
    end
  end

end
