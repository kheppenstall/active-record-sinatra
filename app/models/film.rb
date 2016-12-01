class Film < ActiveRecord::Base
  belongs_to :genre
  belongs_to :director
  validates :title, presence: true, uniqueness: true
  validates :year, presence: true
  validates :box_office_sales, presence: true

  def self.make(params)
    genre = Genre.find_or_create_by(name: params[:genre])
    director = Director.find_or_create_by(name: params[:director])

    Film.create(title: params[:title],
                year: params[:year],
                box_office_sales: params[:box_office_sales],
                genre_id: genre.id,
                director_id: director.id) 
  end
  
  def self.total_sales
    sum("box_office_sales")
  end

  def self.average_sales
    if average("box_office_sales")
      average("box_office_sales").round(2)
    else
      0
    end
  end

  def self.update(id, film_params)
    film = Film.find(id)
    genre = Genre.find_or_create_by(name: film_params[:genre])
    director = Director.find_or_create_by(name: film_params[:director])

    film.update(title: film_params[:title])
    film.update(year: film_params[:year])
    film.update(box_office_sales: film_params[:box_office_sales].to_i)
    film.update(genre_id: genre.id)
    film.update(director_id: director.id)
  end

  # def genre
  #   Genre.find(self.genre_id)
  # end

end