class FooController < ApplicationController
  def index
    
    foo = Foo.new
    foo.message = "Hello World!"

    render inertia: "foo/index", props: { foo: foo }
  end
  
  def bar
  end

end
