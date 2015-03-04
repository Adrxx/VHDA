class StaticsController < ApplicationController
  before_action :set_variables

def experiences
  render :layout => 'layout_exp'
end

def mail
  ContactMailer.send_mail(params[:nombre],params[:correo],params[:mensaje]).deliver
  render nothing:true;
end

private
  def set_variables
    @experiences = Experience.all
  end
end
