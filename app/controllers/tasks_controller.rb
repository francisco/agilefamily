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
    family_member_id = ajaxResponse[0][:familyMember][:id]
    description = ajaxResponse[0][:description]
    @task = Task.create(family_member_id: family_member_id, description: description)
    if ajaxResponse[0].has_key?("monday")
      @task.weekdays << Weekday.find_by_weekday("monday")
    end
    if ajaxResponse[0].has_key?("tuesday")
      @task.weekdays << Weekday.find_by_weekday("tuesday")
    end
    if ajaxResponse[0].has_key?("wednesday")
      @task.weekdays << Weekday.find_by_weekday("wednesday")
    end
    if ajaxResponse[0].has_key?("thursday")
      @task.weekdays << Weekday.find_by_weekday("thursday")
    end
    if ajaxResponse[0].has_key?("friday")
      @task.weekdays << Weekday.find_by_weekday("friday")
    end
    if ajaxResponse[0].has_key?("saturday")
      @task.weekdays << Weekday.find_by_weekday("saturday")
    end
    if ajaxResponse[0].has_key?("sunday")
      @task.weekdays << Weekday.find_by_weekday("sunday")
    end
    respond_to do |format|
      format.json { render json: @task }
    end
  end

  def show

  end

  def update
    Task.update(params[:id], params[:task])
  end

  def destroy
    respond_with Task.destroy(params[:id])
  end
end