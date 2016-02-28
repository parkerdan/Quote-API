class Apikey < ActiveRecord::Base
  validates :for, presence: true, uniqueness: true
  validates :key, presence: true, uniqueness: true
end
