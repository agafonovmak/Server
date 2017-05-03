class Workout
  class TypePolicy < ApplicationPolicy

    def index?
      true
    end

    def show?
      true
    end

    def show_in_main_menu?
      user.has_role?(:fitclubs_administrator)
    end

    def permitted_attributes
      [:title, :description]
    end

  end
end