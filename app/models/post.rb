class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction || Non-Fiction) }
    validate :validates_clickbait

    def validates_clickbait
        if title.present? && !title.include?("Won't Believe")
            errors.add(:title, "not clickbaity enough!")
    end
end

end
