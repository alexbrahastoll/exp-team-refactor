class Team
  Member = Struct.new(:name)

  attr_accessor :members

  def initialize
    @members = []
  end
end
