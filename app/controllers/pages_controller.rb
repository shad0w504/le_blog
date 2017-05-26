require 'json'

class PagesController < ApplicationController
  def home
        
  end
    
  def about
        
  end
    
  def try
    @json = set_json
  end
  
  private
    def set_json
      user = User.first
      articles = user.articles
      @json = Jbuilder.new
      @json.set! :user do
        @json.set! :name, user.username
        @json.set! :articles do
          @json.array! articles, :categories
        end
      end
    end
end