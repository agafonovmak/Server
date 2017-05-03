class CardPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    user == record.user ||
        (user.clubs.include?(record.club) && user.has_role?(:club_administrator)) ||
        (user.franchise.clubs.include?(record.club) && user.has_role?(:franchise_administrator))
  end

  def create?
    user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator)
  end

  def update?
    user == record.user ||
        (user.clubs.include?(record.club) && user.has_role?(:club_administrator)) ||
        (user.franchise.clubs.include?(record.club) && user.has_role?(:franchise_administrator))
  end

  def destroy?
    user == record.user ||
        (user.clubs.include?(record.club) && user.has_role?(:club_administrator)) ||
        (user.franchise.clubs.include?(record.club) && user.has_role?(:franchise_administrator))
  end

  def show_in_main_menu?
    user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator)
  end

  def permitted_attributes
    [:number, :expiration_date, :available_free_freezing_days_count, :aasm_state,
     :user_id, :club_id, :template_id]
  end

  class Scope < Scope
    def resolve
      if user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator)
        scope.where(club: user.selected_club)
      else
          scope.where(user: user)
      end
    end
  end
end
