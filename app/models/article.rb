class Article < ActiveRecord::Base
  validates :title, pressence: true, length: { minimum: 3, maximum: 50}
  validates :description, pressence: true, length: { minimum: 10, maximum: 500}
end