class RolePolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    true
  end

  class Scope < Scope
    def resolve
      if user.has_role? :franchise_administrator
        Role.where(:name.nin => ["franchise_administrator", "fitclubs_administrator", "client"])
      else
        if user.has_role? :club_administrator
          Role.where(:name.nin => ["franchise_administrator", "fitclubs_administrator", "client", "club_administrator"])
        end
      end
    end
  end

end
