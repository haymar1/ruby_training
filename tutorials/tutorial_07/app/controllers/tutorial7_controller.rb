require "rqrcode"

class Tutorial7Controller < ApplicationController
  def generate
    input_param = (params[:generate])[:id]
    qrcode = RQRCode::QRCode.new(input_param)
    @png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 300,
    )
    @result = Base64.encode64(@png.to_s)
  end

  def download
    send_data RQRCode::QRCode.new("@result").as_png(size: 300), type: "image/png", disposition: "attachment"
  end
end
