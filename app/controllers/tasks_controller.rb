class TasksController < ApplicationController
  before_filter :authenticate_family_member!

  def index
    family_member_id = current_family_member.family_id
    @family_members = FamilyMember.where("family_id = ?", family_member_id)
    respond_to do |format|
      format.html
      format.json {
        render json: {
          familyMembers: @family_members
        }
      }
    end
  end

  def create
    ajaxResponse = params[:_json]
    family_member_id = ajaxResponse[0][:userId]
    description = ajaxResponse[0][:description]
    @task = Task.create(family_member_id: family_member_id, description: description)
    @task.addTasks(ajaxResponse)
    respond_to do |format|
      format.json { render json: @task }
    end
  end

  def show

  end

  def update
    @task = Task.find_by_id(params[:id])
    taskWeekday = TaskWeekday.find_by_id(params[:data])
    taskWeekday.update_attributes(complete: true)
    puts "*"*30
    p taskWeekday
    respond_to do |format|
      format.json { render json: @task }
    end

  end

  def destroy
  end
end