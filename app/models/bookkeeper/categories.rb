module Bookkeeper
  class Categories < ActiveRecord::Base
    attr_accessible :name

    belongs_to :categorizable, polymorphic: true

    validates :name, presence: true, uniqueness: true
  end
end
