class FamilyMembersController < ApplicationController
  def update
    @family_member = FamilyMember.find(current_family_member.id)
    # @family_member = FamilyMember.find(params[:id])

    if @family_member.family_id == nil
      family_id = params[:family_member][:family_id]
      current_family_member.update_attributes(family_id: family_id, accepted: false)
      redirect_to "/families/#{family_id}"
    elsif params[:family_member][:accepted] == true
      family_member = FamilyMember.find(params[:family_member][:id])
      family_member.update_attributes(accepted: true, family_id: params[:family_member][:family_id])
      redirect_to "/families/#{family_id}"
    elsif params[:family_member][:accepted] == false
      family_member = FamilyMember.find(params[:family_member][:id])
      family_member.update_attributes(accepted: true)
      redirect_to "/families/new"
    end
    respond_to do |format|
      format.html
      format.json {render json: @family_member}
    end
  end
end
