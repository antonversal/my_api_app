class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.belongs_to :user
      t.string :name
      t.string :pages

      t.timestamps
    end
  end
end
