class StorypointsController < ApplicationController
  
  def new
    @storypoint = Storypoint.new
  end

  def create
    # @storypoint = Storypoint.new(params[:storypoint])
    # params[:plot_id] == 0 ?  plot = Plot.find(params[:storypoint][:plot_id]) : 
    #                         plot = Plot.find(params[:plot_id])

    @plot = Plot.find(params[:plot_id])
    @storypoint = @plot.storypoints.build(params[:storypoint])
    # plot.storypoints << @storypoint
    if @storypoint.save
      if params[:storypoint][:image].present?
        render "storypoints/crop"
      else
        flash[:success] = "Welcome to Defy!"
        redirect_to storypoints_path
      end
    else
      flash.now[:error] = "Errors!"
      render "new"
    end
    
  end


  def index
    @plot = Plot.where(user_id: current_user.id)      
    #@storypoints = Storypoint.where(plot_id: params[:plot_id])
    # @plot = Plot.first
    @storypoints = []
    @plot.each do |plot|
      Storypoint.where(plot_id: plot.id).each do |stp|
        @storypoints.push(stp)
      end
    end
  end

  def show
    plot = Plot.find(params[:plot_id])
    @storypoint = plot.storypoints.find(params[:id])
  end

  def edit
    @storypoint = Storypoint.find(params[:id])
  end

  def update
    @plot = Plot.find(params[:plot_id])
    @storypoint = Storypoint.find(params[:id])
    if @storypoint.update_attributes(params[:storypoint])
      if params[:storypoint][:image].present?
        render "crop"
      else
        flash[:success] = "Profile updated."
        redirect_to plot_storypoint_path(@storypoint.plot_id,@storypoint)
      end
    end
  end

  def destroy
    stp = Storypoint.find(params[:id])
    plot = Plot.find(stp.plot_id)
    plot.first_stp = nil
    plot.save

    stp.destroy
    redirect_to storypoints_path
  end

  def set_plot_id
    stp = Storypoint.find(params[:id])
    plot = Plot.find(params[:plot_id])
    # old_plot = Plot.find(stp.plot_id)
    # old_plot.storypoints.delete(stp)
    plot.storypoints << stp
    redirect_to plot_storypoint_path(stp.plot_id,stp)
  end

  def show_all_stp
    @storypoints = Storypoint.all
  end

  def press_play
    @plots = Plot.where("first_stp is not null")
  end

  def play
    plot = Plot.find(params[:id])
    if params[:stp_id].nil?
      # if Storypoint.find(plot.first_stp) == Storypoint.find(params[:plot])
      @storypoint = Storypoint.find(plot.first_stp)
    else
      @storypoint = Storypoint.find(params[:stp_id])
    end
  end
end
