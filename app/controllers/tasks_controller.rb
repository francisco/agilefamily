class TasksController < ApplicationController

  def index
    @tasks = Task.all
    family_member_id =  current_family_member.family_id
    @family_members = FamilyMember.where("family_id = ?", family_member_id)
    respond_to do |format|
      format.html
      format.json {
        render json: {
          familyMembers: @family_members,
          tasks: @tasks
        }
      }
    end
  end

  def create
    respond_with Task.create(params[:task])
  end

  def show

  end

  def update
    respond_with Task.update(params[:id], params[:task])
  end

  def destroy
    respond_with Task.destroy(params[:id])
  end
end