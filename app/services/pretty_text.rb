# frozen_string_literal: true

require "nokogiri"

# This module provides methods for manipulating and formatting text.
#
# Example usage:
#   PrettyText.excerpt("Lorem ipsum dolor sit amet", 10)
#   # => "Lorem ipsu..."
#
# Arguments:
#   - content: The content to be excerpted (String)
#   - max_length: The maximum length of the excerpt (Integer)
#   - options: Additional options (Hash)
#
# Returns:
#   - The excerpted content (String)
module PrettyText
  def self.excerpt(content, max_length, options = {})
    return "" if content.nil? || content.empty?

    # Parse the content as HTML
    doc = Nokogiri::HTML.fragment(content)

    # Get the text content, stripping out HTML tags
    text_content = doc.text

    # Truncate to max_length
    truncated_content =
      if text_content.length > max_length
        text_content[0...max_length] + "..."
      else
        text_content
      end

    truncated_content
  end
end
