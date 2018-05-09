#
# message_type_service.rb
# Iterable
#
# Copyright (c) 2018 MoveWith. All rights reserved.

module Iterable
  module Services
    class MessageTypeService < BaseService
      class << self
        def all
          get(Util::Config.get('endpoints.message_types'), nil, Iterable::Responses::MessageTypes)
        end
      end
    end
  end
end
