class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def create

  end

  def destroy
  end
end
