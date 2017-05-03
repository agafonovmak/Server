class History::RewardPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      if user.has_role? :franchise_administrator
        scope.where(club.in user.franchise.clubs)
      else
        scope.where(club: user.selected_club)
      end
    end
  end

end
