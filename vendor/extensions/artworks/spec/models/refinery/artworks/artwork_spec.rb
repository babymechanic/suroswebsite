require 'spec_helper'

module Refinery
  module Artworks
    describe Artwork do
      describe "validations" do
        subject do
          FactoryGirl.create(:artwork,
          :name => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:name) { should == "Refinery CMS" }
      end
    end
  end
end
