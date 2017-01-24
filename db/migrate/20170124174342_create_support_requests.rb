class CreateSupportRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :support_requests do |t|
      t.string :title
      t.text :body
      t.belongs_to :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
