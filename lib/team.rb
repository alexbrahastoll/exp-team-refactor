class Team
  Member = Struct.new(:name)

  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(name)
    members << Member.new(name)
  end
end
