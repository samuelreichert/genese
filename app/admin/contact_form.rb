ActiveAdmin.register ContactForm do
  permit_params :email, :message, :readed
end
