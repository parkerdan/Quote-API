class Quote < ActiveRecord::Base
  validates :body, presence: true, uniqueness: true, length: {maximum: 100}
  validates :author, presence: true
  belongs_to :user
end
