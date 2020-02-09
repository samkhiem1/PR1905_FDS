class UpdateThumbnailWorker
  require 'RMagick'
  include Sidekiq::Worker

  def perform(document_id)
    document = Document.find document_id
    pdf = Magick::ImageList.new("#{Rails.root}/public/#{document.attachment.url}")
    thumb = pdf.scale(300, 300)
    thumb_url = "/thumb/#{document.id}.png"
    thumb.write "#{Rails.root}/public#{thumb_url}"
    document.update! thumbnail: thumb_url
  end
end
