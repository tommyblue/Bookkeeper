module Bookkeeper
  class Movement < ActiveRecord::Base
    attr_accessible :amount, :description

    belongs_to :account, class_name: "Bookkeeper::Account"
    has_many :categories, as: :categorizable

    validates :amount, presence: true, numericality: true
    validates :description, presence: true
    validate :amount_cannot_be_zero
    validates :account, presence: true

    default_scope order('created_at DESC')


    after_save do
      self.account.rebuild_balance
    end

    def amount_cannot_be_zero
      if !amount.blank? && amount == 0
        errors.add(:amount, I18n.t(".cannot_be_zero"))
      end
    end
  end
end

