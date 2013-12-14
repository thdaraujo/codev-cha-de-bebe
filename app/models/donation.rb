class Donation < ActiveRecord::Base
	validates :email, presence: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :value, presence: true, :numericality => { :greater_than => 0 }

	belongs_to :baby_shower
end
