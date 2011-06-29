#!/usr/bin/env ruby
version = '1.0.1'
raise "Could not get version so gemspec can not be built" if version.nil?
files = Dir.glob("**/*").flatten.reject do |file|
  file =~ /\.gem$/
end

gemspec = <<EOF
Gem::Specification.new do |s|
  s.name              = %q{refinerycms-questions}
  s.version           = %q{#{version}}
  s.date              = %q{#{Time.now.strftime('%Y-%m-%d')}}
  s.summary           = %q{QA handling functionality for the Refinery CMS project.}
  s.description       = %q{Question handling functionality extracted from Refinery CMS, broadened by answer, to allow you to have a contact form and manage QA in the Refinery backend.}
  s.homepage          = %q{http://ktlabs.ru}
  s.email             = %q{hello@ktlabs.ru}
  s.authors           = ["ktlabs"]
  s.require_paths     = %w(lib)

  s.files             = [
    '#{files.join("',\n    '")}'
  ]
  s.require_path = 'lib'

  s.add_dependency('filters_spam', '~> 0.2')
end
EOF

File.open(File.expand_path("../../refinerycms-questions.gemspec", __FILE__), 'w').puts(gemspec)