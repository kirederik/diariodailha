class CreateWorkWithUs < ActiveRecord::Migration
  def change
    create_table :work_with_us do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
