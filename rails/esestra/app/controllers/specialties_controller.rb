class SpecialtiesController < ApplicationController
  respond_to :html

  def index
    @specialties = Specialty.order(:name).all
  end

  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.new(params[:specialty])

    respond_to do |format|
      if @specialty.save
        format.html { render action: "edit" }
      else
        format.html { render action: "new" }
      end
    end
  end

end
