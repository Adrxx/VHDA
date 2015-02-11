class StaticsController < ApplicationController
  before_action :set_variables

private
  def set_variables
    @experiences = Experience.all
  end
end
