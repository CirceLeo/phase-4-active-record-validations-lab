class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :click_bait

    def click_bait
        if title
            if !title.include?("Won't Believe") && !title.include?("Secret") && !title.include?("Guess") && !title.include?("Top")
                errors.add(:title, "isn't click bait")
            end
            
        end
    end

end
