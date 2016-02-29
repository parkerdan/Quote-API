class Quote < ActiveRecord::Base
  validates :body, presence: true, uniqueness: true, length: {maximum: 100}
  validates :author, presence: true
  belongs_to :user
  before_save :downcase_author

  private

  def downcase_author
    self.author.strip!
    self.author.downcase!
  end
end
