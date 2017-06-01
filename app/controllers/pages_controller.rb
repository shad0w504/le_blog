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
      categories = Category.all
      @json = Jbuilder.new
      @json.array! users do |u|
        @json.set! :name, u.username
        arts = u.articles
        @json.set! :categories do
          @json.array! categories do |c|
            @json.set! c.name do
              @json.set! :articles do
                @json.array! c.articles do |a|
                  if (a.user == u)
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
end