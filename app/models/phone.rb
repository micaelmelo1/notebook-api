# frozen_string_literal: true

# class Phone
class Phone < ApplicationRecord
  belongs_to :contact, optional: true
end
