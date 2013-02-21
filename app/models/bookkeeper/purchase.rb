module Bookkeeper
  class Purchase < ActiveRecord::Base
    attr_accessible :description, :purchase_date, :title, :warranty_duration

    validates_presence_of :title
    validates_numericality_of :warranty_duration, allow_nil: true
    validates_date :purchase_date, allow_nil: true, allow_blank: true
  end
end
