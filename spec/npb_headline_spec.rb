require 'spec_helper'

describe NpbHeadline do
  describe NpbHeadline::Parameters do
    let(:params) { NpbHeadline::Parameters.new(['carp']) }

    it 'should return equivalent id' do
      expect(params.team_id).to eq 6
    end
  end

  describe NpbHeadline::Base do
    describe '#articles' do
      let(:articles) { NpbHeadline::Base.new(6).articles }

      it 'should return correct size' do
        expect(articles.size).to eq 10
      end

      it 'should include correct link' do
        expect(articles[0][:link]).to match /^http:\/\/headlines\.yahoo\.co\.jp\/hl\?a=.*$/
      end
    end
  end
end
