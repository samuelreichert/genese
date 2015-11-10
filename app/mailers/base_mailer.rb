class BaseMailer < MandrillMailer::TemplateMailer
  default from: 'samuelreichertt@gmail.com'
  default view_content_link: true
end
