class ApplicationController < ActionController::Base
  # allow_browser versions: :modern

  # def welcome

  # end
  # def index
  #   @show_mobile_menu = true
  # end
  def current_user
    super || Guest.new
  end
end
