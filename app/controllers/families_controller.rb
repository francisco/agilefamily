class FamiliesController < ApplicationController

  def index
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(params[:family])
    current_family_member.update_attributes(family_id: @family.id)
    redirect_to family_path(@family)
  end

  def show
    @family = Family.find(params[:id])

  end

end
