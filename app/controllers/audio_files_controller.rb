class AudioFilesController < ApplicationController

  def index
  end

  def create
    audio_file = AudioFile.new(audio_file_params)
    audio_file.save
    redirect_to new_audio_file_path
  end

  def new
    @audio_files = AudioFile.all
    @audio_file = AudioFile.new
  end

  def update
  end

  def audio_file_params

      params.require(:audio_file).permit(:title, :audio)
  end
end
