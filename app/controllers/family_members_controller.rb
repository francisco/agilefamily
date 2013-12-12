class FamilyMembersController < ApplicationController
  def update
    # family_member = FamilyMember.find(current_family_member.id)
    family_id = params[:family_member][:family_id]
    current_family_member.update_attributes(family_id: family_id, accepted: false)
    redirect_to "/families/#{family_id}"
  end
end
