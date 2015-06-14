class SurveysController < ApplicationController
  before_action :logged_in?
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  def index
    @surveys = @author.surveys
  end

  def show
  end

  def new
    @survey = Survey.new
    @survey.questions.build
  end

  def edit
    @survey.questions.build
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to @survey, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  def update
    if @survey.update(survey_params)
      redirect_to @survey, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: 'Survey was successfully destroyed.'
  end


  def logged_in?
  if session[:user_type] == "parent" || session[:user_type] == "student"
    redirect_to login_path, notice: "You can't view that page"
  else
    true
  end
end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:title, :description, :author_id, :publish,
          questions_attributes: [:id, :question_text, :question_type, :required,
          :order_number, :_destroy])
    end

    def logged_in?
      @author = Author.find_by_id(session[:user_id])
      unless @author
        redirect_to login_path, notice: "Please login"
      end
    end
end
