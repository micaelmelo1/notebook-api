# frozen_string_literal: true

# class Contact
class Contact < ApplicationRecord
  belongs_to :kind, optional: true

  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def author
    'Micael Melo'
  end

  def as_json(_options = {})
    super(methods: :author)
  end
end
