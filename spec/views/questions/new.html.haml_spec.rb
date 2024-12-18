require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    topic = create(:topic, label: 'Topic')
    assign(:question, Question.new(
      text: "MyString",
      topic: topic,
      sort_index: 1
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[text]"

      assert_select "select[name=?]", "question[topic_id]"

      assert_select "input[name=?]", "question[sort_index]"
    end
  end
end
