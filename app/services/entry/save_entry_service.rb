class Entry::SaveEntryService
  def initialize(account, entry_params)
    @account = account
    @entry_params = entry_params
  end

  def save_entries
    if @entry_params[:repeat] == '1'
      entries_array = create_entries_array

      valid_entries = entries_array.all?(&:valid?)

      if valid_entries
        entries_array.each(&:save)
      end

      valid_entries
    else
      entry = @account.entries.new(@entry_params)
      entry.save
    end
  end

  private
  def create_entries_array
    params_array = Array.new
    repeat = @entry_params[:repeat_times].to_i

    repeat.times do |i|
      params = @entry_params.dup
      params[:date] = mount_date(params, i)
      params_array.push params
    end

    entries = @account.entries.new(params_array)
  end

  def mount_date params, i
    date = params[:date].to_date
    new_date = date + i.send(params[:repeat_frequency])

    new_date.to_s
  end
end
