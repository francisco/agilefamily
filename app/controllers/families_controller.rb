class FamiliesController < ApplicationController
  before_filter :authenticate_family_member!

  def index
    @family = Family.find(current_family_member.family_id)
    redirect_to family_path(@family)
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(params[:family])
    current_family_member.update_attributes(family_id: @family.id, accepted: true)
    redirect_to family_path(@family)
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
