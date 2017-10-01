class RemoveTitleAndAddEmailToAudioFiles < ActiveRecord::Migration[5.1]
  def change
    enable_extension("citext")

    remove_column :audio_files, :title
    add_column :audio_files, :user_email, :citext

    add_index :audio_files, :user_email
  end
end
