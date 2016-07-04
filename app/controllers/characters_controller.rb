class CharactersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_character, only: [:show, :edit, :update, :destroy]
  before_action :authorized_user, only: [ :edit, :update, :destroy]
  before_action :load_user, only: [:index, :show, :create, :update]
  respond_to :html, :js

  def index
    #@user = current_user
    @characters = @user.characters.order("created_at DESC").page(params[:page]).per(5)
  end

  def show
    #@user = current_user
    @for_attributes = @character.for_attributes.order("created_at DESC")
    respond_with(@character)
  end

  def new
    @character = Character.new
  end

  def edit
    current_user.characters.order("created_at DESC").page(params[:page]).per(5)
  end

  def create
    #@user = current_user
    @character = @user.characters.build(character_params)
    @characters = @user.characters.order("created_at DESC").page(params[:page]).per(5)
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
    #@user = current_user
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

  def load_user
    @user = current_user
  end

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:char_name, :image)
  end

  def authorized_user
    @character = current_user.characters.find_by(id: params[:id])
    redirect_to characters_path, notice: "Not authorized to edit this character!" if @character.nil?
  end
end
