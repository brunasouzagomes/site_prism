require 'spec_helper'

describe SitePrism::Page do
  it "should respond to element" do
    SitePrism::Page.should respond_to :element
  end

  it "element method should generate existence check method" do
    class PageWithElement < SitePrism::Page
      element :bob, 'a.b c.d'
    end
    page = PageWithElement.new
    page.should respond_to :has_bob?
  end

  it "element method should generate method to return the element" do
    class PageWithElement < SitePrism::Page
      element :bob, 'a.b c.d'
    end
    page = PageWithElement.new
    page.should respond_to :bob
  end

  it "should be able to wait for an element" do
    class PageWithElement < SitePrism::Page
      element :some_slow_element, 'a.slow'
    end
    page = PageWithElement.new
    page.should respond_to :wait_for_some_slow_element
  end

  it "should know if all mapped elements are on the page" do
    class PageWithAFewElements < SitePrism::Page
      element :bob, 'a.b c.d'
    end
    page = PageWithAFewElements.new
    page.should respond_to :all_there?
  end
end
