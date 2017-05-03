class FranchisePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.has_role?(:fitclubs_administrator)
  end

  def update?
    (user.franchise == record) && user.has_role?(:franchise_administrator)
  end

  def destroy?
    user.has_role?(:fitclubs_administrator)
  end

  def show_in_main_menu?
    user.has_role?(:franchise_administrator)
  end

  def permitted_attributes
    [:name, :description, :first_level_min_score, :second_level_min_score,
     :third_level_min_score, :fourth_level_min_score, :fifth_level_min_score,
     :card_expiration_date_notify_days_count]
  end

  class Scope < Scope
    def resolve
      user.franchises
    end
  end
end
