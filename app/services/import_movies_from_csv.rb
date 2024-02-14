class ImportMoviesFromCsv
    require 'csv'
    def self.import(file)
        CSV.foreach(file.path, headers: true) do |row|
            process_row(row)
        end
    end
    def self.process_row(row)
        row_hash = row.to_hash
        movie = Movie.find_by(name: row_hash["Movie"])
        if movie
            movie.update(description: row_hash["Description"],
                year: row_hash["Year"],
                director: row_hash["Director"],
                country: row_hash["Country"],
                filming_location: row_hash["Filming Location"])
        else
            movie = Movie.create(
                name: row_hash["Movie"],
                description: row_hash["Description"],
                year: row_hash["Year"],
                director: row_hash["Director"],
                country: row_hash["Country"],
                filming_location: row_hash["Filming Location"]
            )
        end
        movie.actors.create(name: row_hash["Actor"])
    end
end

