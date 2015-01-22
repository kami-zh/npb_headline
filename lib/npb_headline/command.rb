module NpbHeadline
  class Command
    class << self
      def start
        params = NpbHeadline::Parameters.new(ARGV)

        headline = NpbHeadline::Base.new(params.team_id)
        headline.articles.each do |h|
          puts "#{h[:title]}（#{h[:publisher]}）"
          puts h[:date]
          puts h[:link]
          puts
        end
      end
    end
  end
end
