class ImportCsvJob < ApplicationJob
    queue_as :default
    def perform(document_id)
        document = ImportFile.find(document_id)
        if document.import_file_type == "movie"
            ImportMoviesFromCsv.import(document.file)
        elsif document.import_file_type == "review"
            ImportReviewsFromCsv.import(document.file)
        end
        document.destroy
    end
end