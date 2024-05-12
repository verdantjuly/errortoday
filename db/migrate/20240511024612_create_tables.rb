class CreateTables < ActiveRecord::Migration[7.1]

  def change
    create_table :errors do |t|
      t.string :error, null: false
      t.string :content, null: true
      t.bigint :user_id, null: false

      t.timestamps
    end
    create_table :occurs do |t|
      t.bigint :user_id, null: false
      t.bigint :error_id, null: false

      t.timestamps
    end

    add_foreign_key :occurs, :users, column: :user_id
    add_foreign_key :occurs, :errors, column: :error_id

    create_table :comments do |t|
      t.bigint :error_id, null: false
      t.bigint :user_id, null: false
      t.string :content, null: false

      t.timestamps
    end

    add_foreign_key :comments, :users, column: :user_id
    add_foreign_key :comments, :errors, column: :error_id
  end

end
