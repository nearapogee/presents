require "test/unit"
require "rails"
require "presents"

class TestPresents < Test::Unit::TestCase
  class Foo
    def name
      "Foo"
    end
  end
  class MyPresenter < Presents::BasePresenter
    presents :foo
    def name_upcase
      foo.name.upcase
    end
  end

  def test_base_presenter_wraps_object
    assert_equal "FOO", MyPresenter.new(Foo.new).name_upcase
  end
end
