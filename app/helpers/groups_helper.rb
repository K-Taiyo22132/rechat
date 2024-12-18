module GroupsHelper
  def home
    if (controller.controller_name == "chats" and controller.action_name == "show") or (controller.controller_name == "messages" and controller.action_name == "index")
      @grouplist = Chat.all
      true
    else
      false
    end
  end

end
  def
  <%= form_tag(book_search_path) do %>
    <p>書籍名（部分一致検索）</p>
    <%= text_field_tag "search[title]", session[:search_title] %><%= submit_tag "検索" %>
  <% end %>
end
