class CreateJwtDenyListing < ActiveRecord::Migration[6.0]
  def change
    create_table :jwt_deny_listings do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false
    end
    add_index :jwt_deny_listings, :jti
  end
end
