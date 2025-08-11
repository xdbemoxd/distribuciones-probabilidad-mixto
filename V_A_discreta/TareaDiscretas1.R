# -----------------------------------------------
# Nombre: [Tu Nombre]
# Cédula: [Tu Cédula]
# Ejercicio 1: Distribución de Poisson
# -----------------------------------------------

# a) Simulación de 10,000 muestras
set.seed(0)                               # Semilla para reproducibilidad
lambda <- 5                               # promedio
n_muestras <- rpois(n = 10000, lambda)    # genera numeros aleatorios con distribucion poison (como lambda=5, rondan este numero)

# b) Probabilidad de exactamente 3 clientes
prob_teorica <- dpois(3, lambda)        # Valor teórico P(X=3)=(λ^3)/(n!*e^λ)=5^3/(6*e^3)=125/(6*e^5)=0.140373895
prob_simulada <- mean(n_muestras == 3)    # muestras==3 es una condicion, lo que convierte al vector muestras en un vector de 1's y 0's
                                        # mean() calcula el promedio de los valores en un vector, en este caso, el promedio de 1's (max(1)/10000)
# Comparación
cat("Probabilidad teórica (3 clientes):",  prob_teorica,  "\n")
cat("Probabilidad simulada (3 clientes):", prob_simulada, "\n")

# c) Histograma y densidad teórica
hist(
  n_muestras,                                    #vector de valores (este caso, clientes con promedio)
  breaks = seq(0, max(n_muestras)),              #barras para cada valor
  freq = FALSE,                                #falso, dara la probabilidad de aparicion
  main = "Distribución de Poisson (λ=5)",      #titulo del plot
  xlab = "Numero de clientes",                 #titulo del eje x
  ylab = "Distribucion",                       #titulo del eje y
  col = "lightblue"     
)

# Superponer distribucion teórica
valores_x <- 0:max(n_muestras)                   #valores del eje x
valores_y <- dpois(valores_x, lambda,0)       #vector con los valores para X=n

lines(
  valores_x,                              
  valores_y, 
  type = "b",      #tipo de linea
  col = "red", 
  lwd = 2, 
  pch = 19
)
     
# cuadro indicando el color de las funciones     
legend("topright", 
  legend = c("Simulación", "Teórica"),
  fill = c("lightblue", "red")
)     





