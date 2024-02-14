class ImportFile < ApplicationRecord
    mount_uploader :file, FileUploader
    enum import_file_type: [:movie , :review]
end
