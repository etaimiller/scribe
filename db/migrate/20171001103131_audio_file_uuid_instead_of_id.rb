class AudioFileUuidInsteadOfId < ActiveRecord::Migration[5.1]
  def change
    drop_table :audio_files

    enable_extension 'pgcrypto'

    create_table :audio_files, id: :uuid do |t|
      t.string :email
      t.string :audio, null: false

      t.timestamps
    end

    add_index :audio_files, :email
  end
end
