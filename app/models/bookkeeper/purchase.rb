module Bookkeeper
  class Purchase < ActiveRecord::Base
    mount_uploader :receipt, ReceiptUploader

    attr_accessible :description, :purchase_date, :title, :warranty_duration, :receipt

    validates_presence_of :title
    validates_numericality_of :warranty_duration, allow_nil: true
    validates_date :purchase_date, allow_nil: true, allow_blank: true
  end
end
