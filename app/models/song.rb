class Song < ActiveRecord::Base
    validates :title, :artist_name, presence: true
    validates :released, inclusion: { in: [ true, false ] }
    validates :release_year, presence: true, if: :released?
    validates :release_year, numericality: { less_than_or_equal_to: Time.now.year, allow_nil: true }
    validates :title, uniqueness: {scope:[:artist_name, :release_year]}
    
    def released?
        self && self.released == true
    end

    
end

# - `title`, a `string`
#   - Must not be blank
#   - Cannot be repeated by the same artist in the same year
# - `released`, a `boolean` describing whether the song was ever officially
#   released
#   - Must be `true` or `false`
# - `release_year`, an `integer`
#   - Optional if `released` is `false`
#   - Must not be blank if `released` is `true`
#   - Must be less than or equal to the current year
# - `artist_name`, a `string`
#   - Must not be blank
# - `genre`, a `string`
# is invalid without release year when released is true