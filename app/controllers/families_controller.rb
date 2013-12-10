class FamiliesController < ApplicationController
  def index

  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.create(params[:family])
  end

end
