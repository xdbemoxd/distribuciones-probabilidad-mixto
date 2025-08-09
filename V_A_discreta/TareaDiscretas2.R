# -----------------------------------------------
# Nombre: [Tu Nombre]
# Cédula: [Tu Cédula]
# Ejercicio 2: Distribución Binomial
# -----------------------------------------------

# a) Simulación de 20,000 muestras
set.seed(0)  
n_pruebas <- 50     #total de pruebas a realizar
p_exito <- 0.85     #probabilidad de exito por prueba
n_muestras <- rbinom(n = 20000, size = n_pruebas, prob = p_exito)

# b) Probabilidad de al menos 45 éxitos (P(X >= 45), 6 sumas )
prob_simulada <- mean(n_muestras >= 45)               # muestras>=45 es una condicion, lo que convierte al vector muestras en un vector de 1's y 0's
prob_teorica <- 1 - pbinom(44, n_pruebas, p_exito)    # P(X >= 45)
                                                      # mean() calcula el promedio de los valores en un vector, en este caso, el promedio de 1's (max(1)/20000)

# Comparación
cat("Probabilidad simulada (≥45 éxitos):", round(prob_simulada, 4), "\n")
cat("Probabilidad teórica (≥45 éxitos):",  round(prob_teorica, 4),  "\n")

# c) Histograma y densidad teórica
hist(
   n_muestras,                                        #vector de valores (en este caso, pruebas exitosas)
   breaks = seq(0, n_pruebas),                      #barras para cada valor (0=sin exito, 50 maximo de exitos)
   freq = FALSE,                                    #falso, dara la probabilidad de tener x exitos
   main = "Distribución Binomial (n=50, p=0.85)",   #titulo del plot
   xlab = "Ensayos exitosos",                       #titulo del eje x
   ylab = "Distribucion",                           #titulo del eje y
   col = "lightblue"
)

# Superponer densidad teórica
valores_xlab <- 0:n_pruebas                               #valores del eje x
valores_ylab <- dbinom(valores_xlab, n_pruebas, p_exito)  #vector con los valores para X=n
lines(
  valores_xlab, 
    valores_ylab, 
    type = "b", 
    col = "red", 
    lwd = 2
)

# cuadro indicando el color de las funciones    
legend("topleft", 
  legend = c("Simulación", "Teórica"),
  fill = c("lightblue", "red")
)

     
