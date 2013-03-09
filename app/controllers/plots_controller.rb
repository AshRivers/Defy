class PlotsController < ApplicationController

  def index
    @plots = Plot.all
  end

  def show
    @plot = Plot.find(params[:id])
  end

  def new
    @plot = Plot.new
  end

  def edit
    @plot = Plot.find(params[:id])
  end

  def create
    @plot = current_user.plots.build(params[:plot])
    if @plot.save
      if params[:plot][:poster].present?
        render "plots/crop"
      else
        flash[:success] = "Welcome to Defy!"
        redirect_to plots_path
      end
    else
      render "new"
    end
  end

  def update
    @plot = Plot.find(params[:id])
    if @plot.update_attributes(params[:plot])
      if params[:plot][:poster].present?
        render "plots/crop"
      else
        redirect_to @plot
      end
    end
  end

  def destroy
    @plot = Plot.find(params[:id])
    @plot.destroy
    redirect_to plots_path
  end

end
