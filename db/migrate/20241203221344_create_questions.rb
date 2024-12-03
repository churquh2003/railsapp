class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.references :quiz, null: false, foreign_key: true
      t.integer :difficulty

      t.timestamps
    end
  end
end
