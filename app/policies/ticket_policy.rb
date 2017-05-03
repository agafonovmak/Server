class TicketPolicy < ApplicationPolicy

  def show_in_main_menu?
    user.has_role?(:franchise_administrator) || user.has_role?(:club_administrator) ||
    user.has_role?(:ticket_reader) || user.has_role?(:ticket_writer)
  end

end
