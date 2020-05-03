class BaseOperation
  def self.call(*args, **kwargs, &block)
    new.call(*args, **kwargs, &block)
  end
end
