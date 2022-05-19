RSpec.describe "GET /api/articles/:id", type: :request do
  let!(:article) { create(:article) }
  let!(:comment) { create(:comment, body: "verygood") }

  subject { response }
  describe "successfully" do
    before do
      get "/api/articles/#{article.id}"
    end

    it "is expected to return a 200 response" do
      expect(response).to have_http_status 200
    end

    it "is expected to return the correct article" do
      expect(response_json["article"]["id"]).to eq article.id
    end
    it "is expected to return a comment for the article" do
      expect(response_json["article"]["comment"]).to eq "very good"
    end
  end
end
