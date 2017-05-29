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
      @json = Jbuilder.new
      @json.array! users do |u|
        @json.set! :name, u.username
        arts = u.articles
        art = 0
        @json.set! :articles do
          @json.set! :categories do
            @json.array! arts[art].categories do |c|
              @json.name c.name
              @json.testah art
              @json.set! :articles do
                @json.array! c.articles do |a|
                  if current_user_article?(u, a)
                    @json.title a.title
                    @json.description a.description
                  end
                end
              art = art + 1
              end
            end
          end
        end
      end
    end
    
    def current_user_article?(u, a)
      u = a.user
    end
end