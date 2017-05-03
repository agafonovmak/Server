class Workout
  class TemplatePolicy < ApplicationPolicy

    def index?
      true
    end

    def show?
      true
    end

    def create?
      user.has_role?(:club_administrator)
    end

    def update?
      user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator) ||
      user.has_role?(:workout_reader) || user.has_role?(:workout_writer)
    end

    def destroy?
      user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator) ||
      user.has_role?(:workout_reader) || user.has_role?(:workout_writer)
    end

    def permitted_attributes
      [:name, :description, :duration, :seats_count, :gym, :share_url, :is_need_manager_confirm, :club_id]
    end

    class Scope < Scope
      def resolve
        if user.has_role?(:fitclubs_administrator)
          scope
        else
          scope.where(club: user.selected_club)
        end
      end
    end

  end
end