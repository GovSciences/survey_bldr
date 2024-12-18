require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    topic = create(:topic, label: 'Topic')

    assign(:question, Question.create!(
      text: "Text",
      topic: topic,
      sort_index: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/Topic/)
    expect(rendered).to match(/2/)
  end
end
