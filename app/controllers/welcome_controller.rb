class WelcomeController < ApplicationController
  def main
  	@first_exp = Storypoint.first if Storypoint.first
  end

  def about
  end
end
