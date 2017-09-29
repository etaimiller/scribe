class CreateAudioFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :audio_files do |t|
      t.string :audio
      t.string :title

      t.timestamps
    end
  end
end
