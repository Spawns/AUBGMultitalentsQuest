class RootController < ApplicationController
 skip_before_filter  :verify_authenticity_token
 layout 'welcome' , only: [:index]
 layout proc{|controller| controller.request.xhr? ? false : 'welcome'}

 #root page
   def index
     #FB
     fboauth = Koala::Facebook::OAuth.new(ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'])
     fbgraph = Koala::Facebook::API.new( fboauth.get_app_access_token)
     @posts = fbgraph.get_connections("1897955503824222" , "posts" , {"limit" => "7"})

      #YT
     channel = Yt::Channel.new url: "https://www.youtube.com/user/AUBG1991"
     @videos = channel.videos.first(4)

   end

  def show_video
    @video = Yt::Video.new id: params[:id]
    respond_to do |format|
      format.js
    end
  end

end


