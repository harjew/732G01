lab2_uppgift_3_b = function(N){
  #' Funktionen simulerar "N" antal syskon, och returnerar detta i ett 
  #' "data.frame" som du kan använda i R commander. 
  #' 
  
  # Sannolikheterna givet i uppgiften
  p = c(0.160, 0.350, 0.290, 0.100, 0.060, 0.020, 0.005, 0.005, 0.004, 0.004, 0.002) 
  # Genererar N antal syskon m.h.a sannolikheten ovan
  data = data.frame(Syskon=sample(c(0:10),replace = T,size = N,prob = p)) 
  return(data)
}
Syskon_10 = lab2_uppgift_3_b(10) # 10 observationer
Syskon_30 = lab2_uppgift_3_b(30) # 30 observationer
Syskon_50 = lab2_uppgift_3_b(50) # 50 observationer
Syskon_100 = lab2_uppgift_3_b(100) # 100 observationer