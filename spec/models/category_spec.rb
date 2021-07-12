require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { Category.new(name: "Full Time", id: "1")}
  it "is valid with valid Category" do
    expect(subject).to be_valid
  end
  it "is not valid without a Category" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
end
