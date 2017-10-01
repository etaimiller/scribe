class AudioFilesController < ApplicationController

  def index
  end

  def create
    audio_file = AudioFile.new(audio_file_params)
    audio_file.save
    redirect_to edit_audio_file_path(audio_file)
  end

  def new
    @audio_file = AudioFile.new
  end

  def edit
    @audio_file = AudioFile.find(params[:id])
  end

  def update
  end

  def audio_file_params
    params.require(:audio_file).permit(:email, :audio)
  end
end
