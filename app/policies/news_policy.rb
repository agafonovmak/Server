class NewsPolicy < ApplicationPolicy

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
    user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator) ||
    user.has_role?(:news_writer)
  end

  def destroy?
    user.has_role?(:club_administrator) || user.has_role?(:franchise_administrator) ||
    user.has_role?(:news_writer)
  end

  def show_in_main_menu?
    user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator) ||
    user.has_role?(:news_reader) || user.has_role?(:news_writer)
  end

  def permitted_attributes
    [:title, :body, :youtube_video_url, :publication_date, :is_on_slider, :file, :remove_file, :sharing_url, :type, :club_id, :user_id]
  end

  class Scope < Scope
    def resolve
      unless user.has_role? :fitclubs_administrator
        scope.where(club: user.selected_club)
      else
        scope
      end
    end
  end

end
