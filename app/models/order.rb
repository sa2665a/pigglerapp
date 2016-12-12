class Order < ApplicationRecord
	belongs_to :user

	validates :source, presence: true
	validates_numericality_of :amount

protected

	def validate
		errors.add(:amount, "should be a positive value") if amount.nil? || amount < 0.01
	end


end
