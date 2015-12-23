class ContactFormsController < ApplicationController
  layout 'landing_page'
  before_action :set_contact_form, only: [:show]
  skip_before_action :authenticate_user!

  # GET /contact_forms
  # GET /contact_forms.json
  def index
    @contact_form = ContactForm.new
  end

  # GET /contact_forms/1
  # GET /contact_forms/1.json
  def show
  end

  # POST /contact_forms
  # POST /contact_forms.json
  def create
    @contact_form = ContactForm.new(contact_form_params)

    respond_to do |format|
      if @contact_form.save
        format.html { redirect_to @contact_form, notice: I18n.t('activerecord.messages.contact_form_created') }
        format.json { render :show, status: :created, location: @contact_form }
      else
        format.html { render :new }
        format.json { render json: @contact_form.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def contact_form_params
    params.require(:contact_form).permit(
      :email,
      :message
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_contact_form
    @contact_form = ContactForm.find(params[:id])
  end
end
