class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.references :question, null: false, index: true
      t.references :user, null: false, index: true
      t.boolean :best_answer, default: false

      t.timestamps null: false
    end
  end
end
