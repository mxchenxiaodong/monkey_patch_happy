
module ActiveRecordExtras
  module Relation
    extend ActiveSupport::Concern

    module ClassMethods
      def create_or_update(attributes, &block)
        new_or_assign(attributes) do |obj|
          block.call(obj) if block_given?
        end
      end


      def new_or_assign(attributes)
        obj = where(attributes).last || new(attributes) #不存在就创建。
        # obj.assign_attributes(attributes)
        yield obj
        obj.updated_at = Time.new
        obj.save
      end
    end
  end
end

# ActiveRecord::Base.send :include, ActiveRecordExtras::Relation