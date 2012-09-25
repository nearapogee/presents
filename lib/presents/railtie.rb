module Presents
  class Railtie < Rails::Railtie
    initializer 'presents.include' do
      ApplicationHelper.send :include, Presents::ApplicationHelperMethods
    end
  end
end
