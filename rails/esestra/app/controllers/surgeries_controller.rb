class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.joins(:specialty).order('specialties.name, name').all
  end

  def calendar

  end
end