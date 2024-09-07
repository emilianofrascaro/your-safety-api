require 'validate_url'

class UsefulLink < ApplicationRecord
  validates :name, presence: true
  validates :url, presence: true, url: true
  validates :description, presence: true

  
end
