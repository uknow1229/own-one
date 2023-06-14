class Public::NotificationsController < ApplicationController
  def index
    @notifications = current_end_user.notifications.order(created_at: :desc)
  end
end
