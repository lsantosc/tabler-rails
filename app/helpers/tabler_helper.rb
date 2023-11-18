# frozen_string_literal: true

module TablerHelper
  def title(title = nil, default_title:)
    content_for :title, title || default_title
  end
end
