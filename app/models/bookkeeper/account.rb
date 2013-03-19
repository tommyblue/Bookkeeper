module Bookkeeper
  class Account < ActiveRecord::Base
    attr_accessible :title, :start_date, :initial_balance, :default

    has_many :movements, class_name: "Bookkeeper::Movement"
    has_many :incomings, class_name: "Bookkeeper::Incoming"
    has_many :outgoings, class_name: "Bookkeeper::Outgoing"

    validates :balance, numericality: { allow_nil: true }
    validates :title, presence: true, uniqueness: true
    validate :default_must_be_uniq

    before_save do
      self.update_start_date if self.start_date.blank? and !self.movements.empty?
      self.rebuild_balance
    end

    def update_balance
      self.rebuild_balance
      self.save
    end

    def rebuild_balance
      self.balance = self.initial_balance + self.incomings.sum(:amount) - self.outgoings.sum(:amount)
    end

    def update_start_date
      self.update_attribute(:start_date, self.movements.first.created_at)
    end

    def self.default
      account = Account.find_by_default(true)
      account = Account.create(title: "Default", start_date: Time.now, initial_balance: 0.0, default: true) if account.nil?

      account
    end

    protected

    def default_must_be_uniq
      errors.add(:base, I18n.t(".default_must_be_uniq")) if Account.find_by_default(true)
    end
  end
end


