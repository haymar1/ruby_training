class Tutorial6Controller < ApplicationController
  def create
  @upload_folder = (params[:upload])[:folder]
  @dir="public/#{@upload_folder}"
  Dir.mkdir(@dir) unless Dir.exist?(@dir)
  @uploaded_img = (params[:upload])[:image]
  File.open(Rails.root.join('public', @upload_folder, @uploaded_img.original_filename), 'wb') do |file|
  file.write(@uploaded_img.read)
  @result=@uploaded_img.original_filename
  end
  end
end
