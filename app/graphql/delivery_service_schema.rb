class DeliveryServiceSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  max_depth 15
  max_complexity 200
  rescue_from ActiveRecord::RecordInvalid, &:message
  rescue_from ActiveRecord::Rollback, &:message
  rescue_from StandardError, &:message
  rescue_from ActiveRecord::RecordNotUnique, &:message
  rescue_from ActiveRecord::RecordNotFound, &:message
  instrument :field, Instruments::ObjectOrHashInstrumentation.new

  use GraphQL::Batch

  def self.id_from_object(object, type_definition, _query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.name, object.id)
  end

  def self.object_from_id(id, query_ctx)
    type_name, item_id = GraphQL::Schema::UniqueWithinType.decode(id)
    if query_ctx[:scope]
      object = query_ctx[:scope].find(item_id)
      throw "#{object} is not a #{type_name}" if object.class.name != type_name
      object
    else
      type_name.constantize.find(item_id)
    end
  end

  def self.resolve_type(_type, obj, _ctx)
    "Types::#{obj.class}Type".constantize
  end
end
