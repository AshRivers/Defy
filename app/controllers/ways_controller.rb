class WaysController < ApplicationController
  def destroy
    Way.find(params[:id]).destroy
    redirect_to ways_path
  end

  def index
    plots = Plot.where(user_id: current_user.id)
    stp = Storypoint.where(plot_id: plots)
    @ways = Way.where(from_storypoint: stp)
  end

  def new
  	@way = Way.new
  end

  def create
  	strp = Storypoint.find(params[:way][:from_storypoint])
    #params[:way][:from_storypoint] = Storypoint.find_by_name(params[:way][:from_storypoint]).id
    #params[:way][:to_storypoint] = Storypoint.find_by_name(params[:way][:to_storypoint]).id
  	@way = strp.ways.build(params[:way])
  	if @way.save
      flash[:success] = "Welcome to Defy!"
    end
    redirect_to plot_storypoints_path(strp.plot_id)
  end

  def edit
    @way = Way.find(params[:id])
  end

  def update 
    @way = Way.find(params[:id])
    if @way.update_attributes(params[:way])
      flash[:success] = "Way updated."
      redirect_to ways_path
    end
  end
end
