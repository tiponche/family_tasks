class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
    breadcrumbs.add "Add new member"

    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to @member
    else
      render :new
    end
  end

  def show
    @member = Member.find_by(id: params[:id])
    breadcrumbs.add "#{@member.name} tasks"

    @tasks = @member.tasks.paginate(per_page: 2, page: params[:page])
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end
end
