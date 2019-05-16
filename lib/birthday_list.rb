require 'birthday'

class Birthday_list
  def initialize
    @birthdays = []
  end

  def store_birthday(argument)
    @birthdays.push(Birthday.new(argument))
  end

  def show_birthdays
    @birthdays.each do |birthday|
      puts "#{birthday.name} => #{birthday.date.strftime('%d %b %Y')}"
    end
  end

  def whose_birthday
    @birthdays.each do |birthday|
      if birthday_is_today?(birthday)
        print(birthday)
      end
    end
  end

  private

  def print(birthday)
    puts "It's #{birthday.name}'s birthday today! They are #{Time.now.year - birthday.date.year} years old!"
  end

  def birthday_is_today?(birthday)
    month_of_birth?(birthday) && day_of_birth?(birthday)
  end

  def day_of_birth?(birthday)
    birthday.date.day == Time.now.day
  end

  def month_of_birth?(birthday)
    birthday.date.month == Time.now.month
  end
end