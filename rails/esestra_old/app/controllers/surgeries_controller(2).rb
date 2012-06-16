class SurgeriesController < ApplicationController
  # timto rikam, ze umim reagovat na pozadavek html formatu
  respond_to :html

  def index
    @surgeries = Surgery.all
    # respond_with @surgeries
    # pokud explicitne nevolam render, tak se zavola render views/surgeries/index.html.erb
  end
end