# frozen_string_literal: true

module TablerAssertions
  def assert_contains(expected_substring, string, *)
    assert(string.include?(expected_substring), *)
  end
end
