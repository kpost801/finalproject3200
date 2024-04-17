class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.belongs_to :survey, null: false, foreign_key: true
      t.boolean :answer

      t.timestamps
    end
  end
end
