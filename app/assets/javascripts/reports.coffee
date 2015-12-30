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
    @expenses_chart = null
    @incomes_chart = null
    @versus_chart = null
    @initLinks()

  initCharts: =>
    if @expenses_element.length > 0
      @expenses_chart = new PieChart(@expenses_categories, @expenses_element).render()

    if @incomes_element.length > 0
      @incomes_chart = new PieChart(@incomes_categories, @incomes_element).render()

  initLinks: =>
    $('a[data-toggle="tab"]').on 'shown.bs.tab', (e) =>
      if e.target.id == 'expinc_link'
        if @versus_element.length > 0
          @versus_chart = new BarChart(@total_entries, @versus_element).render()
          @versus_chart.resize()

      if e.target.id == 'categories_link'
        if @expenses_element.length > 0
          @expenses_chart = new PieChart(@expenses_categories, @expenses_element).render()
          @expenses_chart.resize()

        if @incomes_element.length > 0
          @incomes_chart = new PieChart(@incomes_categories, @incomes_element).render()
          @incomes_chart.resize()
