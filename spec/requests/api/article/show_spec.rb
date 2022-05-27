RSpec.describe 'GET /api/articles/:id', type: :request do
  #let!(:article) { create(:article) }
  let!(:comment) { create(:comment, body: 'very good') }

  subject { response }

  describe 'successfully' do
    before do
      get "/api/articles/#{comment.article.id}"
    end

    it { is_expected.to have_http_status 200 }

    it 'is expected to return the correct article' do
      expect(response_json['article']['id']).to eq comment.article.id
    end

    it 'is expected to return a comment for the article' do
      expect(response_json['article']['comments'][0]['body']).to eq 'very good'
    end
  end
end
