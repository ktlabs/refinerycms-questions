module NavigationHelpers
  module Refinery
    module Questions
      def path_to(page_name)
        case page_name
        when /the qa page/
          new_question_path

        when /the qa thank you page/
          thank_you_questions_path

        when /the qa create page/
          questions_path

        when /the list of questions/
          admin_questions_path

        when /the list of spam questions/
          spam_admin_questions_path
        else
          nil
        end
      end
    end
  end
end