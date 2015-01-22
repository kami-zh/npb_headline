require 'open-uri'
require 'nokogiri'

module NpbHeadline
  class Base
    SIZE = 10

    SOURCE = 'http://baseball.yahoo.co.jp/npb/headlines/?team=%d'

    def initialize(team_id)
      @team_id = team_id
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
  end
end
