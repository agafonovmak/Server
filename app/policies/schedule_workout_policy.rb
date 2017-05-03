class ScheduleWorkoutPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator) ||
    user.has_role?(:workout_reader) || user.has_role?(:workout_writer)
  end

  def update?
    user.clubs.include?(record.club) && ( user.has_role?(:club_administrator || user.has_role?(:workout_reader) || user.has_role?(:workout_writer) ) ||
    user.has_role?(:franchise_administrator) )
  end

  def destroy?
    user.clubs.include?(record.club) && ( user.has_role?(:club_administrator || user.has_role?(:workout_reader) || user.has_role?(:workout_writer) ) ||
    user.has_role?(:franchise_administrator) )
  end

  def permitted_attributes
    [:day_name, :day, :time, :name, :description, :duration, :seats_count, :gym, :share_url,
     :is_need_manager_confirm, :datetime, :price, :status, :schedule_template_id,
     :template_id, :type_id, :club_id, coach_ids:[]]
  end

  def show_in_main_menu?
    user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator) ||
    user.has_role?(:workout_reader) || user.has_role?(:workout_writer)
  end

  class Scope < Scope
    def resolve
      if user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator) ||
         user.has_role?(:workout_reader) || user.has_role?(:workout_writer)
        scope.where(club: user.selected_club)
      else
        scope.where(club.in user.clubs)
      end
    end
  end
end
