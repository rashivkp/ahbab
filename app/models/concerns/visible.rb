module Visible
  extend ActiveSupport::Concern

  class_methods do
    def all_active
      where(active: true)
    end
  end
end

