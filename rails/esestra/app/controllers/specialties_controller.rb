class SpecialtiesController < ApplicationController
  respond_to :html

  def index
    @specialties = Specialty.order(:name).all
  end
end
