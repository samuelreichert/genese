class Mailers::WelcomeMessage
  def self.perform resource
    UserMailerWorker.perform_async resource.id
  end
end
