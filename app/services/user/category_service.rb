class User::CategoryService
  def initialize(resource)
    @account = resource
  end

  def create_categories
    DefaultCategory.find_each do |category|
      @account.categories.create category.attributes.except('id')
    end
  end
end
