module Tremendous
  class Campaign
    attr_accessor :id, :title, :description, :catalogue, :message, :style_id, :sender_name, :raw

    def initialize(attributes)
      attributes       = attributes.with_indifferent_access
      self.id          = attributes[:id]
      self.title       = attributes[:title]
      self.description = attributes[:description]
      self.catalogue   = attributes[:catalogue]
      self.style_id    = attributes[:style_id]
      self.message     = attributes[:message]
      self.sender_name = attributes[:sender_name]
      self.raw         = attributes
    end

    def self.list(filters = {})
      Tremendous::Request.get(
        'campaigns',
        query: filters.merge(Tremendous.default_options),
        format: 'json'
      )[:campaigns].map do |campaign_attributes|
        Tremendous::Campaign.new(campaign_attributes)
      end
    end
  end
end
