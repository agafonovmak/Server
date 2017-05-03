class UserPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    user == record ||
        (user.clubs.include?(record.club) && user.has_role?(:club_administrator)) ||
        (user.franchise.clubs.include?(record.club) && user.has_role?(:franchise_administrator))
  end

  def create?
    (user.has_role? :franchise_administrator) || (user.has_role? :club_administrator)
  end

  def update?
    user == record ||
        (record.clubs.include?(user.clubs.first) && user.has_role?(:club_administrator)) ||
        (record.clubs.include?(user.clubs.first) && user.has_role?(:franchise_administrator))
  end

  def destroy?
    user == record ||
        (record.clubs.include?(user.clubs.first) && user.has_role?(:club_administrator)) ||
        (record.clubs.include?(user.clubs.first) && user.has_role?(:franchise_administrator))
  end

  def show_admin_in_main_menu?
    user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator) ||
    user.has_role?(:club_manager)
  end

  def show_in_main_menu?
    user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator) ||
    user.has_role?(:user_reader) || user.has_role?(:user_writer)
  end

  def permitted_attributes
    [:name, :email, :mobile, :franchise_id, :card_id, :loyalty_id, :ticket_recall_ids, :password, :password_confirmation,
     :ticket_freezing_ids, :ticket_extension_ids, :ticket_message_ids, :ticket_tutoring_ids, :user_type_id, :tutoring_ids,
     :ticket_workout_ids, :reward_ids, :workout_ids, :client_devise_ids, :selected_club_id, role_ids: [], club_ids: []]
  end

  class Scope < Scope
    def resolve
      if user.has_role? :franchise_administrator
        user.franchise.users
      else
        if user.has_role? :club_administrator
          user.club.users
        else
          scope
        end
      end
    end
  end

end
