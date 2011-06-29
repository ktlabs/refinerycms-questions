class QuestionMailer < ActionMailer::Base

  def confirmation(question, request)
    subject     QuestionSetting.confirmation_subject(Globalize.locale)
    recipients  question.email
    from        "\"#{RefinerySetting[:site_name]}\" <no-reply@#{request.domain(RefinerySetting.find_or_set(:tld_length, 1))}>"
    reply_to    QuestionSetting.notification_recipients.split(',').first
    sent_on     Time.now
    @question =  question
  end

  def notification(question, request)
    subject     QuestionSetting.notification_subject
    recipients  QuestionSetting.notification_recipients
    from        "\"#{RefinerySetting[:site_name]}\" <no-reply@#{request.domain(RefinerySetting.find_or_set(:tld_length, 1))}>"
    sent_on     Time.now
    @question =  question
  end

end
