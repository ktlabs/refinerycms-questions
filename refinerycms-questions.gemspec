Gem::Specification.new do |s|
  s.name              = %q{refinerycms-questions}
  s.version           = %q{1.0.1}
  s.date              = %q{2011-06-27}
  s.summary           = %q{QA handling functionality for the Refinery CMS project.}
  s.description       = %q{Question handling functionality extracted from Refinery CMS, broadened by answer, to allow you to have a contact form and manage QA in the Refinery backend.}
  s.homepage          = %q{http://ktlabs.ru}
  s.email             = %q{hello@ktlabs.ru}
  s.authors           = ["ktlabs"]
  s.require_paths     = %w(lib)

  s.files             = [
    'app',
    'app/controllers',
    'app/controllers/admin',
    'app/controllers/admin/questions_controller.rb',
    'app/controllers/admin/question_settings_controller.rb',
    'app/controllers/questions_controller.rb',
    'app/helpers',
    'app/helpers/questions_helper.rb',
    'app/mailers',
    'app/mailers/question_mailer.rb',
    'app/models',
    'app/models/question.rb',
    'app/models/question_setting.rb',
    'app/views',
    'app/views/admin',
    'app/views/admin/questions',
    'app/views/admin/questions/_question.html.erb',
    'app/views/admin/questions/_submenu.html.erb',
    'app/views/admin/questions/index.html.erb',
    'app/views/admin/questions/show.html.erb',
    'app/views/admin/question_settings',
    'app/views/admin/question_settings/_confirmation_email_form.html.erb',
    'app/views/admin/question_settings/_notification_recipients_form.html.erb',
    'app/views/admin/question_settings/edit.html.erb',
    'app/views/questions',
    'app/views/questions/new.html.erb',
    'app/views/questions/thank_you.html.erb',
    'app/views/question_mailer',
    'app/views/question_mailer/confirmation.html.erb',
    'app/views/question_mailer/notification.html.erb',
    'config',
    'config/locales',
    'config/locales/cs.yml',
    'config/locales/da.yml',
    'config/locales/de.yml',
    'config/locales/en-GB.yml',
    'config/locales/en.yml',
    'config/locales/es.yml',
    'config/locales/fr.yml',
    'config/locales/it.yml',
    'config/locales/lolcat.yml',
    'config/locales/lt.yml',
    'config/locales/lv.yml',
    'config/locales/nb.yml',
    'config/locales/nl.yml',
    'config/locales/pl.yml',
    'config/locales/pt-BR.yml',
    'config/locales/ru.yml',
    'config/locales/sk.yml',
    'config/locales/sl.yml',
    'config/locales/sv.yml',
    'config/locales/zh-CN.yml',
    'config/routes.rb',
    'db',
    'db/migrate',
    'db/migrate/20101208082840_create_questions.rb',
    'db/migrate/20101208082841_remove_position_and_open_from_questions.rb',
    'db/seeds',
    'db/seeds/pages_for_questions.rb',
    'features',
    'features/create_questions.feature',
    'features/manage_questions.feature',
    'features/step_definitions',
    'features/step_definitions/question_steps.rb',
    'features/support',
    'features/support/factories.rb',
    'features/support/paths.rb',
    'lib',
    'lib/gemspec.rb',
    'lib/generators',
    'lib/generators/refinerycms_questions_generator.rb',
    'lib/questions.rb',
    'lib/refinerycms-questions.rb',
    'license.md',
    'readme.md',
    'refinerycms-questions.gemspec',
    'spec',
    'spec/models',
    'spec/models/question_spec.rb'
  ]
  s.require_path = 'lib'

  s.add_dependency('filters_spam', '~> 0.2')
end