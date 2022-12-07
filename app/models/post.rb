class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: ["Fiction", "Non-Fiction"]
  validate :clickbait?

  TEST = [/Won't Believe/, /Secret/, /Top \d/i, /Guess/]

  def clickbait?
    if TEST.none? { |t| t.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
