class Ticket
  class TutoringRequestPolicy < ApplicationPolicy

    def index?
      true
    end

    def show?
      user == record.user ||
          (user.clubs.include?(record.club) && user.has_role?(:club_administrator)) ||
          (user.franchise.clubs.include?(record.club) && user.has_role?(:franchise_administrator))
    end

    def create?
      true
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

    def permitted_attributes
      [:user_id, :club_id, :moderator_comment, :coach_id, :time, :comment, :repeats_count]
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
end