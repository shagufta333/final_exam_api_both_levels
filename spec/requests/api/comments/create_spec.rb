RSpec.describe 'POST /api/articles/:id/comments', type: :request do
  let(:article) { create(:article) }

  subject { response }

  describe 'successfully' do
    before do
      post "/api/articles/#{article.id}/comments", params: {
        body: 'This is a new comment'
      }
    end

    it { is_expected.to have_http_status 201 }

    it 'is expected to return the body of the comment' do
      expect(response_json['comment']['body']).to eq 'This is a new comment'
    end
  end

  describe 'unsuccessfully when the article is missing' do
    # TODO
  end

  describe 'unsuccessfully when the comment body is missing' do
    # TODO
  end
end
