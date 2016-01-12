module Filterable
  #use to mixin, can be include all model
  extend ActiveSupport::Concern

  module ClassMethods
    #将参数发送对应的scope，进行条件筛选。
    # as my own filter
    def m_filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end

    #as my own joins_model
    # models = [:mcu,:online_status,[:setting, {:is_actived => ture}]]
    def m_joins_model(models)  
      results = self.where(nil)
      models.each do |model|
        if model.class == Array
          results = results.public_send(model[0],model[1])
        else
          results = results.public_send(model)
        end
      end
      results
    end
  end

  module InstanceMethods
  end


end