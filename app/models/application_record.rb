class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.return_due_date(project)
    project.date.strftime("Campaign ends: %m-%d-%y")
  end

  def self.get_countdown_time(project)
    current_time = (Time.new).strftime('%m-%d-%y')
    due_date = self.return_due_date(project)[15,9]

    year_difference = due_date[6,2].to_i - current_time[6,2].to_i
    day_difference = due_date[3,2].to_i - current_time[3,2].to_i
    month_difference = due_date[0,2].to_i - current_time[0,2].to_i

    if (year_difference <= 0) && (month_difference <= 0) && day_difference <= 0
      return 'The Project is Expired'
    end

    if (year_difference ) == 0 && day_difference >= 0
      months_left = month_difference
      days_left = day_difference
      return "the Project has #{months_left} months and #{days_left} days left"

    elsif (year_difference) == 0 && day_difference < 0
      months_left = (month_difference) - 1
      days_left = (day_difference) + 30
      return "the Project has #{months_left} months and #{days_left} days left"

    elsif (year_difference ) >= 1 && day_difference >= 0
      months_left = (month_difference) + (12 * year_difference)
      days_left = (day_difference)
      return "the Project has #{months_left} months and #{days_left} days left"

    elsif(year_difference) >= 1 && day_difference < 0
      months_left = (month_difference) + (12 * year_difference - 1)
      days_left = (day_difference) + 30
      return "the Project has #{months_left} months and #{days_left} days left"
    end
  end

  def self.count(project)
    pledges= self.where(project_id: project.id)
    count = 0
    pledges.each do |pledge|
      puts pledge
      count += pledge.amount
    end
    return count

  end
  
  def self.find_rewards(project_id)
     self.where(project_id: project_id)
   end

end
