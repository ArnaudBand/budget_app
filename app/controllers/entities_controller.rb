class EntitiesController < ApplicationController
  def index
    @group = current_user.groups.find(params[:group_id])
    @entities = @group.entities
  end

  def new
    @group = Group.find(params[:group_id])
    @entity = Entity.new
  end

  def show; end

  def create
    @entity = Entity.new(entity_params)
    group_id = params[:group_id]
    if @entity.save
      @entity.groups << Group.find(group_id)
      redirect_to group_entities_path
    else
      render :new
    end
  end

  private

  def entity_params
    params.require(:entity).merge({ user_id: current_user.id })
      .permit(:user_id, :name, :amount)
  end
end
