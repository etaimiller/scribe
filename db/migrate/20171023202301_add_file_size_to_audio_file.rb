class AddFileSizeToAudioFile < ActiveRecord::Migration[5.1]
  def change
    add_column :audio_files, :file_size, :float
  end
end
