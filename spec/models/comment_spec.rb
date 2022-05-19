RSpec.describe Comment, type: :model do
  describe 'Products database Table check' do
    it { is_expected.to have_db_column(:body).of_type(:string) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :body }
  end

  describe 'Associations' do
    it { is_expected.to belong_to :article }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:comment)).to be_valid
    end
  end
end
