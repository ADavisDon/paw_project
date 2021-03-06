# frozen_string_literal: true

#:nodoc:
class Event < ApplicationRecord
  validates :event_code, presence: true

  def event_selection
    event_code.to_s
  end
end
