class FooController < ApplicationController
  def index
    
    foo = Foo.new
    foo.message = "Hello World!"

    render inertia: "Foo/Index", props: { foo: foo }
  end
end
