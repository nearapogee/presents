module Presents
  class AggregatePresenter

    # Internal: Create a new presenter.
    #
    # Called by present method in ApplicationHelper.
    #
    # presenters - A hash of the access method name and the presenter
    #
    # Returns self.
    def initialize(presenters, template)
      @presenters = presenters
      @template = template

      @presenters.each do |presenter|
        class_eval do
          define_method(presenter.class.name.underscore.to_sym) do
            presenter
          end
        end
      end
      self
    end

    # Public: Access the view for helper methods.
    #
    # Examples
    #
    #   class XxxPresenter < AggregatePresenter
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
    #   class XxxPresenter < AggregatePresenter
    #     ...
    #     def my_attribute
    #       content_tag :span, "Duck", :class => "mallard"
    #     end
    #     ...
    #   end
    #
    def method_missing(*args, &block)
      @template.send(*args, &block)
    end
  end
end
