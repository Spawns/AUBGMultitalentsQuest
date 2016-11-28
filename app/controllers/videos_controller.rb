class VideosController < InheritedResources::Base

  def upload
    @video = Video.create(video_params)
    if @video
      @upload_info = Video.token_form(save_video_new_video_url(:video_id => @video.id))
    else
      respond_to do |format|
        format.html { render "/applications/new" }
      end
    end
  end

  def save_video
    @video = Video.find(params[:video_id])
    if params[:status].to_i == 200
      @video.update_attributes(:yt_video_id => params[:id].to_s, :is_complete => true)
    else
      Video.delete_video(@video)
    end
    redirect_to new_video_path, :notice => "The video was successfully uploaded"
  end

  private
  def video_params
    params.require(:video).permit!
  end

end
