class Tutorial5Controller < ApplicationController
    def upload_file
    uploaded_io = (params[:content])[:file]
    @result = uploaded_io.read
end
end