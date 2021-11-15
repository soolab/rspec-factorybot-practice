class CreateUserTokens < ActiveRecord::Migration[6.1]
  def change
    create_table :user_tokens do |t|
      t.string :token
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
