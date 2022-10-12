require 'pry'

class GroupsController < ApplicationController
  before_action :set_group, only: %i[show]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    # binding.pry
  end

  def show; end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).merge({ user_id: current_user.id })
      .permit(:user_id, :name, :icon)
  end
end
