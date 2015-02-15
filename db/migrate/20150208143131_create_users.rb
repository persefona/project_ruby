class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :login
      t.string :crypted_password
      t.string :password_salt
      t.string :email
      t.string :persistence_token
      t.string :role

      t.timestamps
    end
  end
end
