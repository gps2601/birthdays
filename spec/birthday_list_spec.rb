require 'birthday_list'
require 'timecop'

describe Birthday_list do
  let(:birthday_list) {
    Birthday_list.new
  }
  it 'can create a birthday list object' do
    expect(birthday_list).to be_a_kind_of(Birthday_list)
  end

  it 'can respond to store' do
    expect(birthday_list).to respond_to(:store_birthday)
  end

  it 'can receieve an argument to store' do
    expect(birthday_list).to respond_to(:store_birthday).with(1).argument
  end

  it 'can receieve an argument to store' do
    expect(birthday_list).to respond_to(:store_birthday).with(1).argument
  end

  it 'starts off being empty when initilized' do
    expect(birthday_list.instance_variable_get(:@birthdays).count).to eq(0)
  end

  it 'can stores a single input' do
    birthday_list.store_birthday(["Geoff", "26-01-1994"])
    expect(birthday_list.instance_variable_get(:@birthdays).count).to eq(1)
  end

  it 'stores input as a birthday' do
    birthday_list.store_birthday(["Geoff", "26-01-1994"])
    expect(birthday_list.instance_variable_get(:@birthdays)[0].class).to eq(Birthday)
  end

  it 'can store multiple input' do
    birthday_list.store_birthday(["Geoff", "26-01-1994"])
    birthday_list.store_birthday(["Annie", "26-11-1994"])
    expect(birthday_list.instance_variable_get(:@birthdays).count).to eq(2)
  end

  it 'has a method for viewing birthdays' do
    expect(birthday_list).to respond_to(:show_birthdays)
  end

  it 'prints a single birthday' do
    birthday_list.store_birthday(["Geoff", "26-01-1994"])

    expect { birthday_list.show_birthdays}.to output("Geoff => 26 Jan 1994\n").to_stdout
  end

  it 'prints multiple birthday' do
    birthday_list.store_birthday(["Geoff", "26-01-1994"])
    birthday_list.store_birthday(["Annie", "26-11-1994"])

    expect { birthday_list.show_birthdays}.to output("Geoff => 26 Jan 1994\nAnnie => 26 Nov 1994\n").to_stdout
  end

  it 'has a method for showing whos birthday it is' do
    expect(birthday_list).to respond_to(:whose_birthday)
  end

  it 'prints someones birthday if it no ones birthday' do
    Timecop.freeze(Time.parse('14-05-2019')) do

    birthday_list.store_birthday(["Mary Poppin", "14-05-1905"])

    expect { birthday_list.whose_birthday}.to output("It's Mary Poppin's birthday today! They are 114 years old!\n").to_stdout
    end
  end

  it 'prints multiple birthdays if' do
    Timecop.freeze(Time.parse('4-08-2019')) do

    birthday_list.store_birthday(["Gary Oldman", "4-8-1955"])
    birthday_list.store_birthday(["Pete Sampras", "4-8-1967"])


    expect { birthday_list.whose_birthday}.to output(
      "It's Gary Oldman's birthday today! They are 64 years old!\nIt's Pete Sampras's birthday today! They are 52 years old!\n"
    ).to_stdout
    end
  end

  it 'wont prints someones birthday if it no ones birthday' do
    Timecop.freeze(Time.parse('22-01-2019')) do

    birthday_list.store_birthday(["Geoff", "26-01-1994"])

    expect { birthday_list.whose_birthday}.to_not output().to_stdout
    end
  end
end
