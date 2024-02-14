class ImportReviewsFromCsv
    require 'csv'

    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            process_row(row)
        end
    end
    def self.process_row(row)
        row_hash = row.to_hash
        movie = Movie.find_by(name: row_hash["Movie"])
        unless movie
            movie.create(name: row_hash["Movie"])
        end
         Review.create(
            movie_id: movie.id,
            stars: row_hash["Stars"],
            user: row_hash["User"],
            review: row_hash["Review"]
        )
    end
end

