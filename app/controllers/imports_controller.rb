class ImportsController < ApplicationController
    def import
        redirect_to request.referer, notice: "please add file to import" if import_file_params[:file].nil?
        redirect_to request.referer, notice: "accepted format is text/csv" if import_file_params[:file].content_type != "text/csv"

        import_file = ImportFile.new(import_file_params)
        if import_file.save!
            ImportCsvJob.perform_later(import_file.id)
            redirect_to root_path, notice: "CSV file import started. Check back later for status."
        else
            redirect_to root_path, notice: "please try again"

        end
    end
    private
    def import_file_params
        params.require(:import_file).permit(:import_file_type , :file)
    end
end
