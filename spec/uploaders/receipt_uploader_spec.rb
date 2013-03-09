require 'carrierwave/test/matchers'

describe ReceiptUploader do
  include CarrierWave::Test::Matchers

  before do
    ReceiptUploader.enable_processing = true
    @uploader = ReceiptUploader.new
    @uploader.store!(File.open(Rails.root.join('..', 'assets', 'images', 'receipt.jpg')))
  end

  after do
    ReceiptUploader.enable_processing = false
    @uploader.remove!
  end

  # context 'the thumb version' do
  #   it "should scale down a landscape image to be exactly 64 by 64 pixels" do
  #     @uploader.thumb.should have_dimensions(64, 64)
  #   end
  # end

  it "should make the image readable only to the owner and not executable" do
    @uploader.should have_permissions(0600)
  end
end
