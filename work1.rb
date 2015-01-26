#---------------------------
 mas=[2,4,5,1,7,15]
  def map(arr)
    for i in(0..(arr.size-1))
      arr[i]=yield arr[i]
    end
  arr
  end
 puts "Rezultat map "
 p (map(mas){|e| e*2})
#---------------------------
  def select (arr)
     j=0
     ar=[]
    for i in(0..(arr.size-1))
      if yield arr[i]
       ar[j]=arr[i] 
       j+=1
      end
    end
  ar
  end
 puts "Rezultat select"
 mas=[2,4,5,1,7,15]
 p (select(mas){|e| e>4})
#---------------------------
  def detect (arr)
   for i in(0..(arr.size-1))
     if yield arr[i]
      a=arr[i]
     break
     end
   end 
   a
  end
 puts "Rezultat detect"
 mas=[2,4,5,1,7,15]
 p (detect(mas){|e| e>4}) 
#---------------------------
  def count (arr)
   a=0
     for i in(0..(arr.size-1))
       if yield arr[i]
        a+=1
       end
     end 
   a
  end
 puts "Rezultat count"
 mas=[2,4,5,1,7,15]
 p (count(mas){|e| e>4}) 
#---------------------------
  def all?(arr)
   a=true
     for i in(0..(arr.size-1))
       unless yield arr[i]
        a=false
       break
       end
     end
   a
  end
 puts "Rezultat all?"
 mas=[2,4,5,1,7,15]
 p(all?(mas){|e| e<10})
#----------------------------  
  def any?(arr)
    b=false
    for i in(0..(arr.size-1))
      if yield arr[i]
       b=true
      break
    end
  end
    b
  end
 puts "Rezultat any?"
 mas=[2,4,5,1,7,15]
 p(any?(mas){|e| e==3})
#----------------------------
  def reduce(arr,ak)
     for i in(0..(arr.size-1))
       ak=yield ak,arr[i]
     end
    ak
  end
 mas=[1,2,3,4]
 puts "Rezultat reduce"
 p(reduce(mas,1){|acc,e| acc+e})
#----------------------------
  def sumkv (a,b,c)
    if a>=b
      if b>=c
       s=(a**2)+(b**2)
      else s=(a**2)+(c**2)
      end
    else if a>=c
      s=(a**2)+(b**2)
         else s=(b**2)+(c**2)
         end
    end
    s
  end
 puts "Rezultat sumkv"
 puts sumkv(2,5,3) 
#---------------------------- 
  def fibbonachi(n)
    f0=0 
    f1=1
    for i in(2..n)
      f=f0+f1
      f0=f1
      f1=f
    end
      if n==0 
       f1=0
      end
    return f1
  end
 puts "Num fibbonachi"
 p(fibbonachi(10))
