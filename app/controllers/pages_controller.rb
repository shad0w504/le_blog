require 'json'
require 'multi_json'
MultiJson.use :yajl

class PagesController < ApplicationController
  def home
        
  end
    
  def about
        
  end
    
  def try
    users = User.all
    
    @json = Jbuilder.new
    @json.array! users, :username, :email
    @json
  end
end