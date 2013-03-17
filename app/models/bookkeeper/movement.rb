module Bookkeeper
  class Movement < ActiveRecord::Base
    attr_accessible :amount, :description, :date

    belongs_to :account, class_name: "Bookkeeper::Account"
    has_many :categories, as: :categorizable

    validates :amount, presence: true, numericality: true
    validates :description, presence: true
    validate :amount_cannot_be_zero
    validates :account, presence: true
    validates :date, presence: true

    default_scope order('date DESC, created_at DESC')

    before_validation do
      self.account = Account.default unless self.account
    end

    after_save do
      self.account.update_balance
    end

    def incoming?
      self.class == Bookkeeper::Incoming
    end

    protected

    def amount_cannot_be_zero
      if !amount.blank? && amount == 0
        errors.add(:amount, I18n.t(".cannot_be_zero"))
      end
    end
  end
end

