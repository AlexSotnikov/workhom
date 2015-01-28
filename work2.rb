def reduce(arr,ak)
  for e in(arr)
     ak=yield ak,e
  end
  ak
end
#---------------------------
def map(arr,&block)
  reduce(arr,[]){|sum,e| sum << block.call(e)}
end
#---------------------------
def select(arr,&block)
  reduce arr,[] do |ag,e| 
    if block.call(e) 
      ag << e
    else 
      ag
    end
  end  
end 
#---------------------------
  def detect (arr,&block)
    i1=true
    reduce(arr,[]) do |a,e| 
      if (block.call(e))and(i1)
        i1=false
        a=e
      end
      a
    end
  end 
#---------------------------
  def count (arr,&block)
    reduce arr,0 do |ag,e| 
      if block.call(e) 
        ag=ag+1
      else 
        ag
      end
    end  
  end  
#---------------------------
  def all?(arr,&block)
     reduce arr,true do |ag,e| 
       unless block.call(e) 
        ag=false
       else
        ag
       end
     end 
  end 
#----------------------------  
  def any?(arr,&block)
    reduce arr,false do |ag,e| 
       if block.call(e) 
        ag=true
       else
        ag
       end
     end 
  end 
#----------------------------
def flatten(arr)
  ar=[] #массив для сохранения результата
  p=proc do |el| #прок записывающий эл. в ar
    if el.is_a?(Array)
      el.each {|e| ar << e}
    else
      ar << el
    end
  end
  aend=true #переменная для завершения цикла 
  while aend #в цикле вызываем р до тех пор пока в ar есть подмассивы
    arr.each {|e| p.call(e)}
    a=(any?(ar){|e| e.is_a?(Array)}) #проверка на подмассивы
    arr=ar
    if aend==true # обнуляем ar, если есть подмассивы
      ar=[]
    end 
  end
ar
end
#-------------------------- 
def reverse(arr)
  j=-1
  ar=[]
  for i in(0..(arr.size-1))
    ar[i]=arr[j]
    j=j-1  
  end
ar
end
#--------------------------
def sortarr(arr)
  rez1=reduce(arr,[])do |acc,e|# част массива чет. чисел
    if (e%2)==0 #проверка на чет.
      acc << e
    else
      acc
    end
  end
  rez2=reduce(arr,[])do |acc,e|# часть массива нечет. чисел
    if (e%2)!=0 #проверка на нечет.
      acc << e
    else
      acc
    end
  end
  rez1=(rez1.sort.reverse)+(rez2.sort.reverse)
#определяем новый массив из частей при этом сортируя и реверсируя их
end
p(sortarr([2,6,7,8,1,3]))
#----------------------------------
def localmax(arr)
  ar=[]
  arr.each_cons(3) do |e| # прсматриваем по 3 ел. делая проверку на макс.
    if (e[1] > e[0])and(e[1] > e[2])
      ar << e[1]
    end
  end
  ar
end
p localmax([1,5,3,1,4,2])
#----------------------------------
def merge(h1,h2)
  h2.each{|k,v| h1[k]=v} 
  h1
end
p merge({'a'=>1},{'b'=>2})
#----------------------------------
