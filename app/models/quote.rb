class Quote < ActiveRecord::Base
  paginates_per 25
  validates :body, presence: true, uniqueness: true, length: {maximum: 100}
  validates :author, presence: true
  belongs_to :user
  before_save :downcase_author
  before_save :squish_string
  private

  def downcase_author
    self.author.strip!
    self.author.downcase!
    self.author.squish!
  end
  def squish_string
    self.body.squish!
  end

end
