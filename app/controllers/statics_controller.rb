class StaticsController < ApplicationController
  before_action :set_variables


def test_mail
  ContactMailer.send_mail(params[:name],params[:mail]).deliver
  render nothing: true
end

private
  def set_variables
    @experiences = Experience.all
  end
end
