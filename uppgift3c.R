lab2_uppgift_3_C = function(){
  #' Funktionen skapar data.frame med 10 000 medelvärden med hjälp av sannolikheten 
  #' givet i uppgiften, med storleken 10, 30, 50 och 100 av data, som du kan 
  #' använda i R commander. 
  #' 
  #' Means_10 = 10 000 medelvärden från 10 observationer. 
  #' Means_30 = 10 000 medelvärden från 30 observationer. 
  #' Means_50 = 10 000 medelvärden från 50 observationer. 
  #' Means_100 = 10 000 medelvärden från 100 observationer. 
  #' 
  
  # Storlekarna vi är intresserad av.
  S = c(10,30,50,100) 
  # Skapar en tom matris med 10 000 rader och 4 kolumner
  data <- matrix(nrow=10000,ncol = 4) 
  # Sannolikheten givet i uppgiften
  p = c(0.160, 0.350, 0.290, 0.100, 0.060, 0.020, 0.005, 0.005, 0.004, 0.004, 0.002) 
  # De 4 olika storlekarna i en loop
  for(j in 1:4){
    # Skapar en tom vektor
    medelv = vector() 
    # 10 000 dragningar i en loop (körs 4 gånger 40 000 gånger)
    for(i in 1:10000){ 
      # Genererar N antal syskon m.h.a sannolikheten p
      syskon = sample(c(0:10),replace = T,size = S[j],prob = p) 
      # Sparar medelvärdet
      medelv[i]= mean(syskon) 
    }
    # Sparar medelvärden för varje storlek i matrisen
    data[,j] = medelv 
  }
  # Skriver om från en matris till "data.frame"
  data = as.data.frame(data) 
  # Sätter rätt namn på rätt kolumn.
  colnames(data) = c("Means_10","Means_30","Means_50","Means_100") 
  return(data)
}

Dragningar = lab2_uppgift_3_C() # data.frame med 10 000 medelvärden.
