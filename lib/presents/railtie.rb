module Presents
  class Railtie < Rails::Railtie
    initializer 'presents.include' do
      ActiveSupport.on_load(:action_view) do
        ::ActionView::Base.send :include, Presents::ActionViewExtension
      end
    end
  end
end
