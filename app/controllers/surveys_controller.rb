class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?

  def index
    @surveys = Survey.all
  end

  def author_profile
    @surveys = Survey.where(author_id: session[:user_id])
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

  private def logged_in?
   unless Author.find_by_id(session[:user_id])
     redirect_to sessions_login_path, notice: 'Invalid username and passoword.'
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
end
