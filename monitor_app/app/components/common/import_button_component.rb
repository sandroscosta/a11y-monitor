# frozen_string_literal: true

class Common::ImportButtonComponent < ViewComponent::Base
  erb_template <<~ERB
    <div class="flex gap-x-4">
      <%= link_to new_project_path, class: "flex gap-2 bg-indigo-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" do %>
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-upload"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" x2="12" y1="3" y2="15"/></svg>
        <span><%= @title %></span>
      <% end %>
    </div>
  ERB

  def initialize(title:)
    @title = title
  end
end
