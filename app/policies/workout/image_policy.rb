class Workout::ImagePolicy < ApplicationPolicy

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
    (user.clubs.include?(record.template.club) && user.has_role?(:club_administrator)) || user.has_role?(:franchise_administrator)
  end

  def destroy?
    (user.clubs.include?(record.template.club) && user.has_role?(:club_administrator)) || user.has_role?(:franchise_administrator)
  end

  def permitted_attributes
    [:file, :template_id]
  end

end
