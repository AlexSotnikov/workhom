#---------------------------
mas=[2,4,5,1,7,15]
def mapmet (arr)
 for i in(0..(arr.size-1))
   arr[i]=yield arr[i]
 end
arr
end
puts "Ishodnij massiv"
p (mas)
puts "Rezultat map "
p (mapmet(mas){|e| e*2})
#---------------------------
def filters (arr)
j=0
ar=[]
 for i in(0..(arr.size-1))
        if yield arr[i]
         ar[j]=arr[i] 
         j+=1
        else arr[i]=0
        end
 end
ar
end
puts "Rezultat filter"
mas=[2,4,5,1,7,15]
p (filters(mas){|e| e>4})
#---------------------------
def detects (arr)
a=a
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
p (detects(mas){|e| e>4}) 
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
def all(arr)
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
p(all(mas){|e| e<10})
#----------------------------  
def any(arr)
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
p(any(mas){|e| e==3})
#----------------------------
def sumkv (a,b,c)
s=s
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
a=((1+5**0.5)/2)**n
b=((1-5**0.5)/2)**n
f=(a-b)/5**0.5
f=f.round
return f
end
puts "Num fibbonachi"
p(fibbonachi(10))
