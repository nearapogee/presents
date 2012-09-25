module Presents
  module ActionViewExtension

    # Public: Render a context in the view to wrap a model with a presenter.
    # 
    # object - The object (model) to be presented.
    # cls - Defaults to nil. Allows manual specification of which Presenter
    #       to use.
    #
    # Examples
    #
    #   <% present @user do |user_presenter| %>
    #     <%= user_presenter.do_presenter_method %>
    #     <%= user_presenter.do_model_method %>
    #   <% end %>
    #
    # Returns the presenter for the model.
    def present(object, cls = nil)
      cls ||= "#{object.class}Presenter".constantize
      presenter = cls.new(object, self)
      yield presenter if block_given?
      presenter
    end

    # Public: Render a context in the view to wrap thwo presenters in an
    #           aggregate presenter.
    #
    # cls - Full classname constant of the aggregate presenter. This is required
    #       unlike the present method.
    # presenters - Variable argument list of presenters/objects. They are
    #              accessed by their underscore class name in the presenter. There
    #              should never be a need to pass two of the same class.
    #
    # Examples
    #
    #   <% present @user do |user_presenter| %>
    #     <% present @organization do |organization_presenter| %>
    #       <% aggregate UserOrganizationPresenter, user_presenter, organization_presenter do |user_organization_presenter| %>
    #
    #         <%= user_presenter.do_presenter_method %>
    #         <%= user_presenter.do_model_method %>
    #
    #         <%= organization_presenter.do_presenter_method %>
    #         <%= organization_presenter.do_model_method %>
    #
    #         <%= user_organization_presenter.do_presenter_method %>
    #         <%= user_organization_presenter.do_model_method %>
    #       <% end %>
    #     <% end %>
    #   <% end %>
    #
    # Returns the aggregate presenter for the model.
    def aggregate(cls, *presenters)
      presenter = cls.new(presenters, self)
      yield presenter if block_given?
      presenter
    end

  end
end
