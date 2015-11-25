class Account::AccountService
  def initialize(resource)
    @account = resource
  end

  def create_categories
    default_categories = DefaultCategory.all
    @account.categories.create(default_categories.as_json)
  end
end
