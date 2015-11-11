class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name1
      t.string :name2
      t.string :lastname1
      t.string :lastname2
      t.string :email
      t.string :address
      t.string :phone
      t.string :password
      #t.string :password_confirmation
      #t.boolean :i_accept_terms_and_conditions
      t.timestamps
    end
  end
end
