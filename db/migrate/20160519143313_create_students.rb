class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name, presence: true
      t.string :class_name
      t.integer :age
      t.date :dob
      t.string :class_number, uniqueness: true
      t.timestamps
    end
  end
end
