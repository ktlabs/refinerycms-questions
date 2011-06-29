class CreateQuestions < ActiveRecord::Migration
  def self.up
    unless ::Question.table_exists?
      create_table ::Question.table_name, :force => true do |t|
        t.string   "name"
        t.string   "email"
        t.string   "phone"
        t.text     "message"
        t.integer  "position"
        t.boolean  "open",       :default => true
        t.datetime "created_at"
        t.datetime "updated_at"
        t.boolean  "spam",       :default => false
      end

      add_index ::Question.table_name, :id
    end

    # todo: remove at 1.0
    create_table ::QuestionSetting.table_name, :force => true do |t|
      t.string   "name"
      t.text     "value"
      t.boolean  "destroyable"
      t.datetime "created_at"
      t.datetime "updated_at"
    end unless ::QuestionSetting.table_exists?

    ::Page.reset_column_information if defined?(::Page)

    load(Rails.root.join('db', 'seeds', 'pages_for_questions.rb').to_s)
  end

  def self.down
     drop_table ::Question.table_name
     # todo: remove at 1.0
     drop_table ::QuestionSetting.table_name
     
     ::Page.delete_all({
       :link_url => ("/qa" || "/qa/thank_you")
     }) if defined?(::Page)
  end
end