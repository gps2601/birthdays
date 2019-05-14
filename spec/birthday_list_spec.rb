require 'birthday_list'

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
end
