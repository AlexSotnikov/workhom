require 'rack'
module SVG
  def method_missing(atribut, val)
      atribut = val
  end
  def line &block
    instance_eval &block
    '<line x1="'+@x1.to_s+'" y1="'+@y1.to_s+'" stroke="black'+
    '" x2="'+@x2.to_s+'" y2="'+@y2.to_s+'" stroke-width="'+@f.to_s+'" /> '
  end
  def rect &block
    instance_eval &block
    '<rect x="'+@x.to_s+'" y="'+@y.to_s+
    '" width="'+@w.to_s+'" height="'+@h.to_s+'" />'
  end
  def circle &block
    instance_eval &block
    '<circle cx="'+@cx.to_s+'" cy="'+@cy.to_s+
    '" r="'+@r.to_s+'" fill="'+@f.to_s+'" stroke="black" stroke-width="1" />'
  end  
end
class Line
  include SVG
  def initialize(x1,y1,x2,y2,f=1)
    @x1=x1;@y1=y1;@x2=x2;@y2=y2;@f=f
  end
  def draw
    line do
      x1 @x1
      x2 @x2
      y1 @y1
      y2 @y2
      f @f
    end
  end
end   
class Rect
  include SVG
  def initialize(x,y,w,h)
    @x=x;@y=y;@w=w;@h=h
  end
  def draw
    rect do 
      x @x
      y @y
      h @h
      w @w
    end
  end
end  
class Circle
  include SVG
  def initialize(x,y,r,f='none')
    @cx=x;@cy=y;@r=r;@f=f
  end
  def draw
    circle do
      cx @cx
      cy @cy
      r @r
      f @f
    end
  end
end
class Arrow 
  include SVG
  def initialize(x1,y1,x2,y2,f=1)
    @x1=x1;@y1=y1;@x2=x2;@y2=y2;@f=f 
  end
  def draw
    (line do
      x1 @x1
      x2 @x2
      y1 @y1
      y2 @y2
    end)+
      (rect do
      x @x=@x2-2
      y @y=@y2-2
      h @h=4
      w @w=7
    end)
  end	
end
elements = [
  Line.new(50, 160, 50, 220),
  Rect.new(42, 120, 16, 40),
  Line.new(75, 235, 100, 235),
  Line.new(50, 275, 200, 275),
  Circle.new(50, 180, 3, 'black'),
  Line.new(50, 100, 50, 120),
  Arrow.new(200, 250, 175, 240),
  Line.new(75, 220, 75, 250, 3),
  Circle.new(100, 100, 3, 'black'),
  Line.new(100, 160, 100, 180),
  Line.new(200, 220, 175, 230),
  Line.new(110, 290, 140, 290),
  Line.new(178, 165, 178, 195),
  Line.new(200, 160, 200, 220),
  Line.new(100, 180, 150, 235),
  Line.new(150, 180, 100, 235),
  Line.new(200, 250, 200, 275),
  Line.new(200, 100, 200, 120),
  Circle.new(125, 275, 3, 'black'),
  Line.new(78, 165, 78, 195),
  Arrow.new(50, 100, 250, 100),
  Circle.new(100, 180, 3, 'black'),
  Line.new(100, 100, 100, 120),
  Rect.new(92, 120, 16, 40),
  Circle.new(200, 100, 3, 'black'),
  Circle.new(200, 180, 3, 'black'),
  Line.new(50, 180, 72, 180),
  Line.new(72, 165, 72, 195),
  Circle.new(70, 235, 25),
  Line.new(150, 100, 150, 120),
  Line.new(125, 275, 125, 290),
  Line.new(78, 180, 100, 180),
  Line.new(150, 180, 172, 180),
  Circle.new(180, 235, 25),
  Line.new(172, 165, 172, 195),
  Circle.new(150, 180, 3, 'black'),
  Arrow.new(178, 180, 250, 180),
  Line.new(150, 160, 150, 180),
  Line.new(175, 235, 150, 235),
  Rect.new(142, 120, 16, 40),
  Line.new(50, 250, 50, 275),
  Circle.new(150, 100, 3, 'black'),
  Rect.new(192, 120, 16, 40),
  Line.new(50, 220, 75, 230),
  Line.new(175, 220, 175, 250, 3),
  Arrow.new(50, 250, 75, 240)
]
File.open('image.svg','wb') do |f|
  f.puts('<?xml version="1.0" encoding="UTF-8" standalone="no"?>
  <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="300" height="300">')
  elements.each do |el|
    f.puts(el.draw)
  end	 
     
   f.puts('</svg>')
end
f = File.new("image.svg")
content = f.read
f.close
Rack::Server.start :app => lambda {|env| [200, {}, [content]] }

