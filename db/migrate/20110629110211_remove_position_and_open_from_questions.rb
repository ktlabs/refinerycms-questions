class RemovePositionAndOpenFromQuestions < ActiveRecord::Migration
  def self.up
    remove_column :questions, :position
    remove_column :questions, :open
  end

  def self.down
    add_column :questions, :position, :integer
    add_column :questions, :open,     :boolean, :default => true
  end
end
