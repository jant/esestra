class SpecialtiesController < ApplicationController
  def index
    @specialties = Specialty.order(:name).all
  end

  def show
    redirect_to edit_specialty_path, id: params[:id]
  end

  def new
    @specialty = Specialty.new
    render :form
  end

  def edit
    @specialty = Specialty.find(params[:id])
    render :form
  end

  def create
    @specialty = Specialty.create(params[:specialty])
    render :form
  end

  def update
    @specialty = Specialty.find(params[:id])
    @specialty.update_attributes(params[:specialty])
    render :form
  end

  def destroy
    @specialty = Specialty.find(params[:id])
    @specialty.destroy
    redirect_to specialties_path
  end

end
