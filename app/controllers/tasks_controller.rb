class TasksController < ApplicationController

  def index
    @tasks = Task.all
    family_member_id = current_family_member.family_id
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
    ajaxResponse = params[:_json]
    user_id = ajaxResponse.familyMember.id
    description = ajaxResponse.description
    @task = Task.create(family_member_id: user_id)
    if ajaxResponse.has_key?("monday")
      @task.weekdays << Weekday.find_by_weekday("monday")
    end
    if ajaxResponse.has_key?("tuesday")
      @task.weekdays << Weekday.find_by_weekday("tuesday")
    end
    if ajaxResponse.has_key?("wednesday")
      @task.weekdays << Weekday.find_by_weekday("wednesday")
    end
    if ajaxResponse.has_key?("thursday")
      @task.weekdays << Weekday.find_by_weekday("thursday")
    end
    if ajaxResponse.has_key?("friday")
      @task.weekdays << Weekday.find_by_weekday("friday")
    end
    if ajaxResponse.has_key?("saturday")
      @task.weekdays << Weekday.find_by_weekday("saturday")
    end
    if ajaxResponse.has_key?("sunday")
      @task.weekdays << Weekday.find_by_weekday("sunday")
    end
    respond_to do |format|
      format.json { render json: @task }
    end
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