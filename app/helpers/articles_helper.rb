module ArticlesHelper
  def errors_any_helper(article)
    if article.errors.any?
      plr = pluralize(article.errors.count, "error")
      header_errors = content_tag(:h2, "#{plr} prohibited this article from being saved:" )
      msg = ''
      article.errors.full_messages.each do |message|
        msg += content_tag(:li, message)
      end
      list_errors = content_tag(:ul, msg.html_safe)
      content_tag(:div, id: 'error_explanation') do
        (header_errors + list_errors)
      end
    else
      content_tag(:h2, "Changes was succesfully saved!")
    end
  end

#   <% if article.errors.any? %>
#   <div id="error_explanation">
#     <h2><%= pluralize(article.errors.count, "error") %> prohibited this article from being saved:</h2>

#     <ul>
#       <% article.errors.full_messages.each do |message| %>
#         <li><%= message %></li>
#       <% end %>
#     </ul>
#   </div>
# <% end %>
end
