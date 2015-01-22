module NpbHeadline
  class Parameters
    TEAMS = {
      'giants'   => 1,
      'swallows' => 2,
      'baystars' => 3,
      'dragons'  => 4,
      'tigers'   => 5,
      'carp'     => 6,
      'lions'    => 7,
      'fighters' => 8,
      'marines'  => 9,
      'orix'     => 11,
      'hawks'    => 12,
      'eagles'   => 376
    }

    attr_reader :team_id

    def initialize(argv)
      team_name = argv[0]

      raise ArgumentError unless TEAMS.has_key?(team_name)

      @team_id = TEAMS[team_name]
    end
  end
end
