require 'rails_helper'

RSpec.describe "surveys/new", type: :view do
  before(:each) do
    topic = create(:topic)
    customer = create(:customer)
    assign(:survey, Survey.new(
      name: "MyString",
      topic: topic,
      customer: customer
    ))
  end

  it "renders new survey form" do
    render

    assert_select "form[action=?][method=?]", surveys_path, "post" do

      assert_select "input[name=?]", "survey[name]"

      assert_select "select[name=?]", "survey[topic_id]"

      assert_select "select[name=?]", "survey[customer_id]"
    end
  end
end
