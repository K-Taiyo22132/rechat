module GroupsHelper
  def
  <%= form_tag(book_search_path) do %>
    <p>書籍名（部分一致検索）</p>
    <%= text_field_tag "search[title]", session[:search_title] %><%= submit_tag "検索" %>
  <% end %>
end
