class ForAttributesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_for_attribute, only: [:show, :edit, :update, :destroy]
  before_action :set_character, only: [:index, :show, :new, :edit, :create, :update, :destroy]
  before_action :require_permission, only: [:destroy, :edit, :update]
  respond_to :html, :js

  def index
    #@character = Character.find(params[:character_id])
    @for_attributes = @character.for_attributes.order("created_at DESC").page(params[:page]).per(5)

  end

  def show
    #@character = Character.find(params[:character_id])
    respond_with(@for_attribute)
  end

  def new
    #@character = Character.find(params[:character_id])
    @for_attribute = ForAttribute.new
  end

  def edit
    #@character = Character.find(params[:character_id])
    @for_attribute = @character.for_attributes.find(params[:id])

  end

  def create
    #@character = Character.find(params[:character_id])
    @for_attribute = @character.for_attributes.build(for_attribute_params)
    respond_to do |format|
      if @for_attribute.save
        format.html { redirect_to character_path(@character) }
        format.js
      else
        format.html { redirect_to character_path(@character) }
      end
    end
  end

  def update
    #@character = Character.find(params[:character_id])
    @for_attribute.update(for_attribute_params)
    respond_to do |format|
      if @for_attribute.save
        format.html { redirect_to character_path(@character) }
        format.js
      else
        format.html { redirect_to character_path(@character) }
      end
    end
  end

  def destroy
    @for_attribute.destroy

    respond_to do |format|
      format.html {  redirect_to character_path(@character)  }
      format.js
      flash[:success] = "Character deleted!"
    end
  end

  private

  def set_character
    @character = current_user.characters.find(params[:character_id])
  end

  def set_for_attribute
    @for_attribute = ForAttribute.find(params[:id])
  end

  def for_attribute_params
    params.require(:for_attribute).permit(:name, :value, :image)
  end

  def require_permission
      unless current_user == @character.user
        redirect_to(root_path,:notice=>"You can only edit/delete attributes of the characters you created")
      end
    end
end
