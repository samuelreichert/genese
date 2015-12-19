ActiveAdmin.register User do
  permit_params :email, :encrypted_password, :name, :picture, :birth_date, :main_account
end
