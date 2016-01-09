class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /entries
  # GET /entries.json
  def index
    @current_account = current_account
    @entries = Entry::SearchEntries.new.call(@current_account, params.slice(:category, :current_date, :description))

    @categories = categories_ordered
    @current_date = (params[:current_date] || Date.today).to_date
    mount_totalizers
    mount_date_links(@current_date)

    respond_with({
      account: @current_account,
      entries: @entries,
      categories: @categories,
      current_date: @current_date,
      totalizer_incomes: @totalizer_incomes,
      totalizer_expenses: @totalizer_expenses,
      totalizer_difference: @totalizer_difference,
      last_month_path: @last_month_path,
      next_month_path: @next_month_path
    })
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    @current_account = current_account
  end

  # GET /entries/new
  def new
    entry_type = params[:entries_type]
    @current_account = current_account
    @entry = @current_account.entries.new(entries_type: entry_type)
    @categories = categories_ordered
  end

  # GET /entries/1/edit
  def edit
    @current_account = current_account
    @categories = categories_ordered
  end

  # POST /entries
  # POST /entries.json
  def create
    @current_account = current_account
    entries_saved = Entry::SaveEntryService.new(@current_account, entry_params).save_entries

    respond_to do |format|
      if entries_saved
        format.html { redirect_to entries_path, notice: I18n.t('activerecord.messages.entry_created') }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to entries_path, notice: I18n.t('activerecord.messages.entry_updated') }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: I18n.t('activerecord.messages.entry_destroyed') }
      format.json { head :no_content }
    end
  end

  def entry_paid
    paid = params[:paid]
    entry_id = params[:entry_id]
    entry = Entry.find(entry_id)

    respond_to do |format|
      if entry.update(paid: paid)
        format.html { redirect_to entries_path }
        format.json { render json: {url: entries_path} }
      else
        format.html { render :index }
        format.json { render json: entry.errors }
      end
    end
  end

  private
  def set_entry
    @entry = Entry.find(params[:id])
  end

  def mount_totalizers
    incomes = @entries.where(entries_type: 'income')
    expenses = @entries.where(entries_type: 'expense')
    sum_incomes = incomes.sum :value
    sum_expenses = expenses.sum :value
    @totalizer_incomes = sum_incomes
    @totalizer_expenses = sum_expenses
    @totalizer_difference = sum_incomes - sum_expenses
  end

  def mount_date_links date
    last_month = date - 1.month
    next_month = date + 1.month

    @last_month_path = entries_path(current_date: last_month)
    @next_month_path = entries_path(current_date: next_month)
  end

  def categories_ordered
    @current_account.categories.order(:name)
  end

  def entry_params
    params.require(:entry).permit(
      :entries_type,
      :description,
      :note,
      :date,
      :value,
      :paid,
      :repeat,
      :repeat_times,
      :repeat_frequency,
      :category_id
    )
  end
end
