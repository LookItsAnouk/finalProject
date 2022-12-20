class Migraine < ApplicationRecord
    belongs_to :user, optional: true
    validates :migraine_date, presence: true
    alias_attribute :start_time, :migraine_date

    def is_valid?
        migraine_date.present? 
    end

end
