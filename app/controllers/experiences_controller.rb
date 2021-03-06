class ExperiencesController < ApplicationController

  layout "layout_admin"

  before_action :set_experience, only: [:show, :edit, :update, :destroy]
  before_action :check_permission, except: [:show]
  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
    render :layout => 'layout_exp'
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
  end

  # POST /experiences
  def create
    @experience = Experience.new(experience_params)

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: "La experiencia ha sido creada. " }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /experiences/1
  def update
    respond_to do |format|
      if @experience.update(experience_params)

        format.html { redirect_to @experience, notice: 'Se han guardado los cambios.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /experiences/1
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'La experiencia fue destuida exitosamente.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:title, :description, :place , :date, :sphere, photos_attributes: [:id,:file,:description,:_destroy])
    end

    def check_permission
      if current_user.nil?
        redirect_to login_url, alert: 'Por favor inicia sesión' 
      end
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
