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
      users = User.all
      art = 0
      @json = Jbuilder.new
      @json.array! users do |u|
        @json.set! :name, u.username
        arts = u.articles
        @json.set! :articles do
          @json.set! :categories do
            @json.array! arts[0].categories do |c|
              @json.title c.name
              @json.set! :articles do
                @json.array! c.articles do |a|
                  @json.title a.title
                  @json.description a.description
                end
              end
            end
          end
        end
      end
    end
end