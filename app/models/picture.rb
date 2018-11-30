class Picture < ApplicationRecord
  belongs_to :product

  def uploaded_file=(incoming_file)
    self.filename = incoming_file[:file].original_filename
    self.content_type = incoming_file[:file].content_type
    self.file_contents = incoming_file[:file].read
  end

  def filename= (new_filename)
    write_attribute("filename", sanitize_filename(new_filename))
  end

  # def initialize(params = {})
  #   file = params.delete(:file)
  #   super
  #   if file
  #     self.filename = sanitize_filename(file.original_filename)
  #     self.content_type = file.content_type
  #     self.file_contents = file.read
  #   end
  # end

  private
  def sanitize_filename(filename)
    return File.basename(filename)
  end
end

