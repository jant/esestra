class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.order(:name).all
  end
end