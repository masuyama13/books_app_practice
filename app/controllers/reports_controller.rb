# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  def index
    @reports = Report.page(params[:page])
  end

  # GET /reports/1
  def show
    @report = Report.find(params[:id])
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    if @report.save
      redirect_to @report, notice: t("flash.create", model: @report.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      redirect_to @report, notice: t("flash.update", model: @report.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /reports/1
  def destroy
    if @report.destroy
      redirect_to reports_url, notice: t("flash.destroy", model: @report.model_name.human)
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit(:title, :body)
    end
end
