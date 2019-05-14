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
      if birthday.date.month == Time.now.month && birthday.date.day == Time.now.day
        puts "It's #{birthday.name}'s birthday today! They are #{Time.now.year - birthday.date.year} years old!"
      end
    end
  end
end
