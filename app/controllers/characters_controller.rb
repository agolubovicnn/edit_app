class CharactersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: [:destroy, :edit, :update]
  before_action :all_characters, only: [:index, :create,  :destroy]
  respond_to :html, :js

  def index
    #@user = current_user
    #@characters = current_user.characters.order("created_at DESC").page(params[:page]).per(5)
  end

  def show
    #@user = current_user
    @for_attributes = @character.for_attributes.order("created_at DESC")
    respond_with(@character)
  end

  def new
    @character = current_user.characters.build
  end

  def edit

  end

  def create
    #@user = current_user
    @character = current_user.characters.build(character_params)
    #@characters = current_user.characters.order("created_at DESC").page(params[:page]).per(5)
    respond_to do |format|
      if @character.save
        format.js
      else
        format.html { redirect_to characters_path }
        format.js
      end
    end
  end

  def update
    @character.update(character_params)
    respond_to do |format|
      if @character.save
        format.js
      else
        format.html { redirect_to characters_path }
      end
    end
  end

  def destroy
    @character.destroy

    respond_to do |format|
      format.js
    end
  end

  private

  def all_characters
    @characters = current_user.characters.order("created_at DESC").page(params[:page]).per(5)
  end

  def set_character
    @character = current_user.characters.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:char_name, :image)
  end

  def require_permission
    set_character
    unless current_user == @character.user
      redirect_to(root_path,:notice=>"You can edit/delete only characters you created")
    end
  end

end
