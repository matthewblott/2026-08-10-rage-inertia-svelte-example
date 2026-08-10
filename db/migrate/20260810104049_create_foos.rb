class CreateFoos < ActiveRecord::Migration[8.1]
  def change
    create_table :foos do |t|
      t.string :message
    end
  end
end
