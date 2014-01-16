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
    #numbers correspond to days of the week starting with Monday, which equals 1
    ajaxResponse[0].each_pair{ |x, y|
      x == "1" && y == "true" ? @task.weekdays << Weekday.find_by_weekday("1") : nil
      x == "2" && y == "true" ? @task.weekdays << Weekday.find_by_weekday("2") : nil
      x == "3" && y == "true" ? @task.weekdays << Weekday.find_by_weekday("3") : nil
      x == "4" && y == "true" ? @task.weekdays << Weekday.find_by_weekday("4") : nil
      x == "5" && y == "true" ? @task.weekdays << Weekday.find_by_weekday("5") : nil
      x == "6" && y == "true" ? @task.weekdays << Weekday.find_by_weekday("6") : nil
      x == "7" && y == "true" ? @task.weekdays << Weekday.find_by_weekday("7") : nil
    }
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