class StaticPagesController < ApplicationController
  def welcome
  end
  
  def register
    render template: "users/register"
  end
  
end
