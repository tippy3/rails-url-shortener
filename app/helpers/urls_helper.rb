module UrlsHelper
  def qrcode_tag(text)
    ::RQRCode::QRCode.new(text).as_svg(module_size: 4).html_safe
  end
end
