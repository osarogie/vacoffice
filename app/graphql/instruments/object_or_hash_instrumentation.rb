# frozen_string_literal: true

module Instruments
  class ObjectOrHashInstrumentation
    def instrument(_type, field)
      if field.resolve_proc.is_a?(GraphQL::Field::Resolve::BuiltInResolve)
        field.redefine do
          resolve lambda { |obj, _args, _ctx|
            property = field.property || field.name

            if obj.is_a?(Hash)
              obj[property]
            else
              obj.public_send(property)
            end
          }
        end
      else
        field
      end
    end
  end
end
