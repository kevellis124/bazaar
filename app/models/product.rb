class Product < ApplicationRecord
  def uploaded_file=(incoming_file)
    self.image = incoming_file.read
  end

  def filename=(new_filename)
    write_attribute("filename", sanitize_filename(new_filename))
  end

  private
  def sanitize_filename(filename)
    just_filename = File.basename(filename)
    just_filename.gsub(/[^\w\.\-]/, '_')
  end
end
