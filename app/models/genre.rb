class Genre < ActiveRecord::Base
  has_many :films

  # def films
  #   Films.where(genre_id: self.id)
  # end

end