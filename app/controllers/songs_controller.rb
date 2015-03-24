class SongsController < ApplicationController
	before_action :signed_in_user, only: [:upload]

	def upload
		@song = Song.new
	end

	def upload_procces
		@song = Song.find(params[:id])
		if @song.update(params.require(:song).permit(:data))
			render text: 'Successfully uploaded!!'
		else
			render text: 'Cannot upload this file :('
		end
	end

	def create
		if params[:song].blank?
			flash[:error] = 'This is unavilable, please check your file!'
			redirect_to :back
			return
		else
			@song = Song.new(song_params)
			if @song.save
				flash[:success] = "Your song is successfully uploaded!!"
				redirect_to @song
			else
				render 'upload'
			end
		end
	end

	def index
	end


  private

  def song_params
  	params.require(:song).permit(:title, :author, :upload_file)
  end

    def signed_in_user
		unless signed_in?
		store_location
		redirect_to signin_url, notice: "Please sign in." unless signed_in?
	end
  end
end