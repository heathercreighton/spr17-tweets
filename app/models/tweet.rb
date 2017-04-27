class Tweet < ActiveRecord::Base

	belongs_to :user

	validates :message, presence: true, length: {maximum: 140, too_long: "Everybody knows a tweet is only 140 characters long!  Don't be so wordy!"}
end
