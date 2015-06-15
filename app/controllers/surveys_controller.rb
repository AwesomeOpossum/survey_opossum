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
    if @survey.questions.any? { |a| a.answers.all.count == 0}
      @survey.questions.build
    else
      redirect_to root_url, notice: "You can't edit this survey because answers have been submitted"
    end
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.author_id = session[:user_id]
    if @survey.save
      redirect_to surveys_url, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  def update
    if @survey.update(survey_params)
      redirect_to surveys_url, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @survey.destroy
    redirect_to surveys_url, notice: 'Survey was successfully destroyed.'
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
