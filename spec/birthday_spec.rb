require 'birthday'
require 'date'

describe Birthday do
  it 'can accept an argument to the constructor' do
    expect(Birthday).to respond_to(:new).with(1).argument
  end

  it 'can store the name passed in as an instance variable' do
    birthday = Birthday.new(["Geoff", "26-01-1994"])

    expect(birthday.name).to eq("Geoff")
  end

  it 'can store the birthday passed in as an instance variable as a date' do
    birthday = Birthday.new(["Annie", "26-01-1994"])

    expect(birthday.date).to eq(Date.new(1994,01,26))
  end
end
