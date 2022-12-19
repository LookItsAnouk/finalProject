class Migraine < ApplicationRecord
    belongs_to :user, optional: true
    validates :migraine_date, presence: true
    
    def is_valid?
        migraine_date.present? 
    end

end
