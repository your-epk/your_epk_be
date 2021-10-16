require 'rails_helper'

RSpec.describe FilmEpk do
  describe 'associations' do 
    it { should belong_to(:user) }
  end   
end
