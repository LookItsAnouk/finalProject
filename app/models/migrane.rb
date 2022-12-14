class Migrane < ApplicationRecord
    belongs_to :user, optional: true
    validates :migrane_date, presence: true
    
    def is_valid?
        migrane_date.present? 
    end

end
