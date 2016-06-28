class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    render ('static_pages/index')
  end

  def show
   @user = current_user
   @characters = @user.characters
  end

end
