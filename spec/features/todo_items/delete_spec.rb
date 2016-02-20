require 'rails_helper'

describe "Deleting todo items" do
	let(:user) { todo_list.user }
	let!(:todo_list) { create(:todo_list) }
	# let!(:todo_list) { user.todo_lists.create(title: "Grocery list", description: "Groceries") }
	let!(:todo_item) { todo_list.todo_items.create(content: "Milk") }
	# let(:user) { create(:user) }
	before { sign_in user, password: "password" }

	it "is successful" do
		visit_todo_list(todo_list)
		within "#todo_item_#{todo_item.id}" do
			click_link "Delete"
		end
		expect(page).to have_content("Todo list item was deleted.")
		expect(TodoItem.count).to eq(0)
	end
end
