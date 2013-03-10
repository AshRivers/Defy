class WelcomeController < ApplicationController
  def main
  	@first_exp = Storypoint.first
  end
end
