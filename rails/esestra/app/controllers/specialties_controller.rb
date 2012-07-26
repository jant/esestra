class SpecialtiesController < ApplicationController
  respond_to :html

  def index
    @specialties = Specialty.all
  end
end
