class Movie < ApplicationRecord
    has_many :movie_actors
    has_many :actors, through: :movie_actors
    has_many :reviews, dependent: :destroy
    accepts_nested_attributes_for :movie_actors
end
