class SurveysController < ApplicationController
  before_action :set_survey, only: %i[ show edit update destroy ]

  # GET /surveys
  def index
    @surveys = Survey.all
  end

  # GET /surveys/1
  def show
    @survey = Survey.find(params[:id])
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  def create
    @survey = Survey.new(survey_params)
    @survey.question = @survey
    if @survey.save
      redirect_to @survey, notice: "Survey was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /surveys/1
  def update
    @survey = Survey.find(params[:id])
    if @survey.update(survey_params)
      redirect_to @survey, notice: "Survey was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy!
    redirect_to surveys_url, notice: "Survey was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:title, :description, :answer)
    end
end
