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
    #numbers correspond to days of the week starting with Monday, which equals 1
    if ajaxResponse[0].has_key?("1")
      @task.weekdays << Weekday.find_by_weekday("1")
    end
    if ajaxResponse[0].has_key?("2")
      @task.weekdays << Weekday.find_by_weekday("2")
    end
    if ajaxResponse[0].has_key?("3")
      @task.weekdays << Weekday.find_by_weekday("3")
    end
    if ajaxResponse[0].has_key?("4")
      @task.weekdays << Weekday.find_by_weekday("4")
    end
    if ajaxResponse[0].has_key?("5")
      @task.weekdays << Weekday.find_by_weekday("5")
    end
    if ajaxResponse[0].has_key?("6")
      @task.weekdays << Weekday.find_by_weekday("6")
    end
    if ajaxResponse[0].has_key?("7")
      @task.weekdays << Weekday.find_by_weekday("7")
    end
    puts "*"*30
    p @task
    p @task.weekdays
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