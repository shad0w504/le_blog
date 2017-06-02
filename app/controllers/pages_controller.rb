require 'json'

class PagesController < ApplicationController
  def home
        
  end
    
  def about
        
  end
    
  def try
    @json = set_json
  end
  
  def try2
    @json = set_json_user(4)
  end
  
  private
    def set_json
      users = User.all
      categories = Category.all
      @json = Jbuilder.new
      @json.array! users do |u|
        @json.set! :name, u.username
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
    
    def set_json_user(id)
      u = User.find(id)
      categories = Category.all
      @json = Jbuilder.new
      @json.set! :user do
        @json.set! :name, u.username
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