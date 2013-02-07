module CheckoutsHelper
  def checkout_dates
    [['1 week',"#{1.week.from_now}"], ['2 weeks',"#{2.weeks.from_now}"], ['3 weeks',"#{3.weeks.from_now}"], ['1 month',"#{1.month.from_now}"], ['2 months',"#{2.months.from_now}"], ['3 months',"#{3.months.from_now}"], ['4 months',"#{4.months.from_now}"], ['5 months',"#{5.months.from_now}"], ['6 months',"#{6.months.from_now}"]]
  end

  def due_date(checkout)
    checkout.due_date.strftime("%B %e") unless checkout.due_date.nil?
  end

  def remaining_time_of_rental(checkout) 
    distance_of_time_in_words(Time.now, checkout.due_date) unless checkout.due_date.nil?
  end
end

