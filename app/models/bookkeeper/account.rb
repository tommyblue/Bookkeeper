module Bookkeeper
  class Account < ActiveRecord::Base
    attr_accessible :start_date, :initial_balance

    has_many :movements, class_name: "Bookkeeper::Movement"

    validates :balance, numericality: { allow_nil: true }
    validates :title, presence: true, uniqueness: true

    before_save do
      self.update_start_date if self.start_date.blank? and !self.movements.empty?
      self.rebuild_balance
    end

    def rebuild_balance
      self.balance = self.initial_balance + Movement.where('bookkeeper_movements.account_id = ?', self.id).sum(:amount)
    end

    def update_start_date
      self.update_attribute(:start_date, self.movements.first.created_at)
    end
  end
end


