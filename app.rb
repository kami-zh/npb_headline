require 'open-uri'
require 'nokogiri'

module NPB
  class Headline
    SIZE = 10

    SOURCE = 'http://baseball.yahoo.co.jp/npb/headlines/?team=%d'

    def initialize(team_id)
      @team_id  = team_id
    end

    def articles
      _articles = []

      doc.css('#NpbNewsSearch li').each do |li|
        article = {}

        li.css('a').each do |a|
          article[:link]  = a.attribute('href').value
          article[:title] = a.content
        end

        li.css('em').each do |em|
          m = em.content.match /^（(?<publisher>.+)）\s(?<date>.+)$/
          article[:publisher] = m[:publisher]
          article[:date]      = m[:date]
        end

        _articles << article
      end

      _articles.shift(SIZE)
    end

    private

    def doc
      Nokogiri::HTML(open(url))
    end

    def url
      sprintf(SOURCE, @team_id)
    end

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
end

params = NPB::Headline::Parameters.new(ARGV)

headline = NPB::Headline.new(params.team_id)
headline.articles.each do |h|
  puts "#{h[:title]}（#{h[:publisher]}）"
  puts h[:date]
  puts h[:link]
  puts
end
