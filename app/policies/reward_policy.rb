class RewardPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    (user.franchise == record.template.franchise)
  end

  def create?
    user.has_role?(:moderator) || user.has_role?(:franchise_administrator)
  end

  def update?
    ((user.franchise == record.template.franchise) && user.has_role?(:club_administrator)) ||
    ((user.franchise == record.template.franchise) && user.has_role?(:franchise_administrator))
  end

  def destroy
    ((user.franchise == record.template.franchise) && user.has_role?(:club_administrator)) ||
    ((user.franchise == record.template.franchise) && user.has_role?(:franchise_administrator))
  end

  def permitted_attributes
    # [:name, :description, :phone, :address, :website_link, :franchise_id, :user_ids]
  end

  class Scope < Scope
    def resolve
      if user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator)
        scope.where(club: user.selected_club)
      else
        user.rewards
      end
    end
  end
end
