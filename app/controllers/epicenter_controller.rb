class EpicenterController < ApplicationController
  def feed
  	@following_tweets = []

  	Tweet.all.each do |tweet|
  		if current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id
  			@following_tweets.push(tweet)
  		end
  	end		

  end

  def all_users
    @users = User.all
  end  

  def show_user
  	@user = User.find(params[:id])
  end

  def now_following
  	@user = User.find(params[:id].to_i)
  	current_user.following.push(params[:id].to_i)
  	current_user.save
  end

  def unfollow
  	@user = User.find(params[:id].to_i)
  	current_user.following.delete(params[:id].to_i)
  	current_user.save
  end

  def epi_tweet

    @tweet = Tweet.new

    @tweet.message = "#{params[:tweet][:message]}"
    @tweet.user_id = "#{params[:tweet][:user_id].to_i}"

    @tweet.save
    redirect_to root_path

  end  
end















