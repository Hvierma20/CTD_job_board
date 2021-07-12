require 'rails_helper'
RSpec.describe Job, type: :model do
  subject { Job.new(title: "Rails Developer", description: "Developer", company: "CTD", url: "www.codethedream.org", created_at: "2021-07-10", updated_at: "2021-07-10", category_id: "1" )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "is not valid without a title" do
    subject.title=nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a description" do
    subject.description=nil
    expect(subject).to_not be_valid
  end
end