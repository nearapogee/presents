module Presents
  class BasePresenter

    # Internal: Create a new presenter.
    #
    # Called by present method in ApplicationHelper.
    #
    def initialize(object, template = nil)
      @object = object
      @template = template
    end

    # Public: Create an accessor to the wrapped object.
    #
    # Examples
    #
    #   class DuckPresenter < BasePresenter
    #     presents :duck
    #     
    #     ...
    #
    #     def my_attribute
    #       h.number_as_currency(duck.attribute)
    #     end
    #
    #   end
    #
    def self.presents(name)
      define_method(name) do
        @object
      end
    end

    # Public: Access the view for helper methods.
    #
    # Examples
    #
    #   class XxxPresenter < BasePresenter
    #     ...
    #     def my_attribute
    #       h.content_tag :span, "Duck", :class => "mallard"
    #     end
    #     ...
    #   end
    #
    # Returns the template.
    def h
      @template
    end

    # Internal: Send any unknown methods to the template.
    #
    # This is done so you don't have to access them through h.
    #
    # Examples
    #
    #   class XxxPresenter < BasePresenter
    #     ...
    #     def my_attribute
    #       content_tag :span, "Duck", :class => "mallard"
    #     end
    #     ...
    #   end
    #
    def method_missing(*args, &block)
      @template.send(*args, &block) if @template
    end
  end
end
