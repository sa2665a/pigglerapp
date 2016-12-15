class Order < ApplicationRecord
	belongs_to :user

	validates :source, presence: true
	validates :amount, :numericality => { :greater_than => 0, :less_than_or_equal_to => 200}, :presence => true


end
