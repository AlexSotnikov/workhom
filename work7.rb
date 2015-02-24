require 'rack'
require_relative 'work2.rb'
class Myapp
  def call(ehv)
    q=ehv['QUERY_STRING']
    name=q.split('=').last
      if name
       a=fib(name.to_i)
       p a
       [200,{'Content-Type' => 'text/html'},['number of Fibonachi ='+a.to_s]] 
     else
       [200,{'Content-Type' => 'text/html'},['Enter the number of Fibonachi <form><input name="name"><input type="submit"></form>']]
     end
  end
end
Rack::Server.start :app => Myapp.new
