class @Reports
  constructor: (
    expensesElement,
    incomesElement,
    versusElement,
    expensesCategories,
    incomesCategories,
    totalEntries
  ) ->
    @expenses_element = expensesElement
    @incomes_element = incomesElement
    @versus_element = versusElement
    @expenses_categories = expensesCategories
    @incomes_categories = incomesCategories
    @total_entries = totalEntries
    @initLinks()

  initCharts: ->
    if @expenses_element.length > 0
      new PieChart(@expenses_categories, @expenses_element).render()

    if @incomes_element.length > 0
      new PieChart(@incomes_categories, @incomes_element).render()

    if @versus_element.length > 0
      new BarChart(@total_entries, @versus_element).render()

  initLinks: ->
    $('#categories_link').on 'click', (e) =>
      if @expenses_element.length > 0
        new PieChart(@expenses_categories, @expenses_element).render()

      if @incomes_element.length > 0
        new PieChart(@incomes_categories, @incomes_element).render()

    $('#expinc_link').on 'click', (e) =>
      if @versus_element.length > 0
        new BarChart(@total_entries, @versus_element).render()
