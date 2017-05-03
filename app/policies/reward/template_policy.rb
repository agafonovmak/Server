class Reward
  class TemplatePolicy < ApplicationPolicy

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
      user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator)
    end

    def destroy?
      user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator)
    end

    def permitted_attributes
      [:name, :description, :shared_url, :level_cost, :started_rewards_count, :file, :remove_file, :show_in_app, :club_id]
    end

    class Scope < Scope
      def resolve
        if user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator)
          scope.where(club: user.selected_club)
        else
          scope.where(club.in user.clubs)
        end
      end
    end

  end
end