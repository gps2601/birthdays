require 'date'

class Birthday
  attr_reader :name, :date
  def initialize(friend)
    @name = friend[0]
    @date = Date.parse(friend[1])
  end
end
