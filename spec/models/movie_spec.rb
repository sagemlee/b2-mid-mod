require 'rails_helper'

RSpec.describe Movie do
  describe "validations" do
    it {should belong_to :studio}
  end
end
