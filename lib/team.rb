class Team
  Member = Struct.new(:name)

  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(name)
    members << Member.new(name)
  end

  def member_names
    members.map(&:name)
  end

  def print_member_names(opts = {})
    opts =
      {
        limit:                       members.size,
        member_name_presentation:    ->(name) { puts name },
        member_names_transformation: :itself,
        title:                       nil
      }.merge(opts)

    puts opts[:title] if opts[:title]

    member_names.take(opts[:limit]).
      send(opts[:member_names_transformation]).
      each(&opts[:member_name_presentation])
  end
end
