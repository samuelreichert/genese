class Users::RegistrationsController < Devise::RegistrationsController
  protect_from_forgery with: :exception
  respond_to :json, :html
  before_filter :configure_permitted_parameters, if: :devise_controller?

  # GET /register/signup
  def new
    email = params[:email]
    super do |resource|
      resource[:email] = email
    end
  end

  # POST /register
  # POST /register.json
  def create
    super do |resource|
      if resource.persisted?
        account = User::SignupService.new(resource).create_account
        User::CategoryService.new(account).create_categories
      end
    end
  end

  # DELETE /register/1
  # DELETE /register/1.json
  def destroy
    User::RegistrationService.new(resource).destroy_accounts
    super
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :birth_date, :avatar, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :birth_date, :avatar, :email, :password, :current_password) }
  end
end
