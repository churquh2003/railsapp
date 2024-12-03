class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.string :content
      t.references :quiz, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
