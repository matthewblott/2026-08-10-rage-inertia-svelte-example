class BarController < ApplicationController
  def index
    
    foo = Foo.new
    foo.message = "Hello World!"

    render inertia: "Bar/Index", props: { foo: foo }
  end
end
