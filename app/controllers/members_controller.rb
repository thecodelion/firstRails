class MembersController < ApplicationController

  before_action :find_member, only: [:edit,:show,:update,:destroy]
  def index
    @members = Member.all
    @categories = Category.all.map {|c| [c.name, c.id]}
  end

  def new
    @member = Member.new
    @categories = Category.all.map {|c| [c.name, c.id]}
  end

  def create
    @member = Member.new(member_params)
    @member.save
    flash[:notice] = "Created Article"
    redirect_to members_path
  end

  def edit
    @categories = Category.all.map {|c| [c.name, c.id]}
  end

  def update
    if @member.update(member_params)
      flash[:notice] = "Updated Article"
      redirect_to members_path
    else
      render 'edit'
    end

  end

  def destroy
    @member.destroy
    redirect_to members_path
  end

  def show
  end

private

def member_params
  params.require(:member).permit(:firstname,:lastname,:number,:image,:category_id)
end

def find_member
  @member = Member.find(params[:id])
end

end
