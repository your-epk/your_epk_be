require 'rails_helper'

RSpec.describe FilmEpk do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:awards) }
    it { should have_many(:film_fams) }
  end
end
