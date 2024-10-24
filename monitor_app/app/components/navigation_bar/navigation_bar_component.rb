# frozen_string_literal: true

class NavigationBar::NavigationBarComponent < ViewComponent::Base
  include ActionView::Helpers::UrlHelper
  
  # menu items should be placed inside the hash on the correct order
  MENU_ITEMS = [ { :title => "Home", :url => "root_path" } ].freeze

  def initialize
    @menu_items = MENU_ITEMS
    @home = "root_path"
  end

  def render_url(url)
    send(url)
  end

  def to_link(item)
    link_to item[:title], render_url(item[:url]), class: "hover:underline hover:underline-offset-2 hover:decoration-violet-500 hover:decoration-4 hover:font-bold"
  end
end