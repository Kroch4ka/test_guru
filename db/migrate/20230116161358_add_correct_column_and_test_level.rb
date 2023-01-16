class AddCorrectColumnAndTestLevel < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :correct, :boolean, default: false
    add_column :tests, :level, :integer, default: 0
  end
end
