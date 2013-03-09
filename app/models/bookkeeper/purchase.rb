module Bookkeeper
  class Purchase < ActiveRecord::Base
    mount_uploader :receipt, ReceiptUploader

    attr_accessible :description, :purchase_date, :title, :warranty_duration, :receipt, :invoice, :amount

    has_many :categories, as: :categorizable

    validates_presence_of :title
    validates_numericality_of :warranty_duration, allow_nil: true
    validates_numericality_of :amount, allow_nil: true
    validates_date :purchase_date, allow_nil: true, allow_blank: true

    default_scope order('created_at DESC')
  end
end
