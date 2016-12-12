class Order < ApplicationRecord
	belongs_to :user

	validates :source, :presence => {:message => " Location cannot be blank"}
	validates :amount, :numericality => { :greater_than => 0, :less_than_or_equal_to => 200, :message => "Maximum amount $200" }, :presence => true


end
