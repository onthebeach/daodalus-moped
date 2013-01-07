require 'spec_helper'

class DSLIntegrationTests
  extend Daodalus::DSL
  target :cathouse, :cats


  def self.number_of_paws_of_a_cat_named_felix
    select(:paws).
      where(:name).eq('Felix').
      find
  end

end

describe "#find" do

  subject { DSLIntegrationTests }

  it 'works in a class' do
    subject.send(:insert, name: "Felix", paws: 4)
    subject.number_of_paws_of_a_cat_named_felix.first.should eq 4
  end
end