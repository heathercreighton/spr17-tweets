class Tweet < ActiveRecord::Base

	belongs_to :user
	has_many :tweet_tags
	has_many :tags, through: :tweet_tags


	before_validation :link_check, :apply_link
	validates :message, presence: true, length: {maximum: 140, too_long: "Everybody knows a tweet is only 140 characters long!  Don't be so wordy!"}



	private
	def link_check
			arr = []
      if self.message.include? "http://"
        arr = self.message.split
        index = arr.map { |x| x.include? "http://" }.index(true)
        self.link = arr[index]

        if arr[index].length > 23
          arr[index] = "#{arr[index][0..20]}..."
        end

        self.message = arr.join(" ")
      end  

  end
     
  


  def apply_link
	  arr = []

	  if self.message.include? "http://"
	  	arr = self.message.split

		  index = arr.map { |x| x.include? "http://" }.index(true)


		  url = arr[index]

		  arr[index] = "<a href='#{self.link}' target='_blank'>#{url}</a>"

		  self.message = arr.join(" ")
		end


	end

end
