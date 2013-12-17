class FamilyMembersController < ApplicationController
  def update
    # family_id = params[:family_member][:family_id]
    # current_family_member.update_attributes(family_id: family_id, accepted: false)
    # redirect_to "/families/#{family_id}"

    @family_member = FamilyMember.find(current_family_member.id)
    puts "*"*30
    p params[:accepted]

    if @family_member.family_id == nil
      family_id = params[:family_member][:family_id]
      current_family_member.update_attributes(family_id: family_id, accepted: false)
      redirect_to "/families/#{family_id}"
      return
    elsif params[:accepted] == "true"
      family_member = FamilyMember.find(params[:id])
      family_member.update_attributes(accepted: true, family_id: params[:family_id])
    elsif params[:accepted] == "false"
      family_member = FamilyMember.find(params[:id])
      family_member.update_attributes(accepted: false)
    end
    respond_to do |format|
      format.html
      format.json {render json: @family_member}
    end
  end

  def show
    @tasks = Task.where("family_member_id = ?", params[:id])
    tasks_info = []

    @tasks.each do |task|
      tasks_info << {task: task, days: task.weekdays}
    end

    respond_to do |format|
      format.json {render json: tasks_info}
    end
  end

end
