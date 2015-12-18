class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @current_date = (params[:current_date] || Date.today).to_date
    @current_account = current_account
    @entries = current_entries

    mount_totalizers
    mount_date_links
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
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
    @categories = categories_ordered
  end

  # POST /entries
  # POST /entries.json
  def create
    @current_account = current_account
    @entry = @current_account.entries.new(entry_params)
    # entries_saved = save_entries

    respond_to do |format|
      if @entry.save
        format.html { redirect_to :index, notice: I18n.t('activerecord.messages.entry_created') }
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
        format.html { redirect_to @entry, notice: I18n.t('activerecord.messages.entry_updated') }
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

  private
  def set_entry
    @entry = Entry.find(params[:id])
  end

  def current_entries
    date = @current_date
    date_begin = date.beginning_of_month
    date_end = date.end_of_month
    @current_account.entries.where(date: date_begin..date_end)
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

  def mount_date_links
    last_month = @current_date - 1.month
    next_month = @current_date + 1.month
    @last_month_path = entries_path(current_date: last_month)
    @next_month_path = entries_path(current_date: next_month)
  end

  def categories_ordered
    @current_account.categories.order(:name)
  end

  # def save_entries
  #   if @create_params[:repeat] == '1'
  #     @params_array = Array.new
  #     repeat = @create_params[:repeat_times].to_i

  #     repeat.times do |i|
  #       new_params = @create_params.dup
  #       date = new_params[:date]

  #       new_date = case new_params[:repeat_frequency]
  #         when "yearly" then date.to_date + i.years
  #         when "monthly" then date.to_date + i.months
  #         when "weekly" then date.to_date + i.weeks
  #         when "daily" then date.to_date + i.days
  #       end
  #       new_params[:date] = new_date.to_s
  #       @params_array.push new_params
  #       binding.pry
  #     end

  #     entries = @current_account.entries.new(@params_array)
  #     success = entries.map(&:save)
  #     if success.all?
  #       return true
  #     else
  #       errored = entries.select{|entry| !entry.errors.blank?}

  #       raise ActiveRecord::Rollback
  #     end
  #   else
  #     entry = @current_account.entries.new(@create_params)
  #     entry.save
  #   end
  # end

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
