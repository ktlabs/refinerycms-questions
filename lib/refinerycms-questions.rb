require File.expand_path('../questions', __FILE__)

module Refinery
  module Questions
    class Engine < Rails::Engine
      config.to_prepare do
        require 'filters_spam'
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "refinery_questions"
          plugin.directory = "questions"
          plugin.menu_match = /(refinery|admin)\/question(s|_settings)$/
          plugin.activity = {
            :class => QuestionSetting,
            :title => 'name'
          }
        end
      end
    end
  end
end