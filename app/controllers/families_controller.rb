class FamiliesController < ApplicationController
  # before_filter :authenticate_user!

  # def index
  #   if current_family_member
  #     if current_family_member.family_id
  #       redirect_to family_path(current_family_member.family_id)
  #     end
  #   end
  # end

  def new
    @family = Family.new
    @family_member = FamilyMember.new
  end

  def create
    if params[:family]
      @family = Family.create(params[:family])
      current_family_member.update_attributes(family_id: @family.id)
      redirect_to family_path(@family)
    elsif params[:family_member]
      @family = Family.find(params[:family_member])
      current_family_member.update_attributes(family_id: @family.id)
      redirect_to family_path(@family)
    end
  end

  def show
    @family = Family.find(current_family_member.family_id)
    @family_members = @family.family_members

    respond_to do |format|
      format.html
      format.json {
        render json: @family_members
      }
    end
  end
end
