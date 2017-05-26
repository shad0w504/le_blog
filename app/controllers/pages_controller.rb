require 'json'

class PagesController < ApplicationController
  def home
        
  end
    
  def about
        
  end
    
  def try
    @car = {make: bmw, year: 2003}
       
    @car.to_json
    
    @car
  end
end