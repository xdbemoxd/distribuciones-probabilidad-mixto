# -----------------------------------------------
# Nombre: [Tu Nombre]
# Cédula: [Tu Cédula]
# Estimación de π por Método Monte Carlo
# -----------------------------------------------

# a) Función para estimar π con n puntos
estimar_pi <- function(n) {
  # Generar coordenadas uniformes [0,1]
  va_x <- runif(n, min = 0, max = 1)                      # vector con distribucion uniforme para X
  va_y <- runif(n, min = 0, max = 1)                      # vector con distribucion uniforme para Y
  
  # b) Calcular distancia al origen
  distancia_cuadrada <- va_x^2 + va_y^2                         # vector con las distancias de cada par x,y
  
  # c) Contar puntos dentro del círculo (distancia ≤ 1)
  dentro_circulo <- sum(distancia_cuadrada <= 1)          # la suma debe ser menor o igual a uno (pow(1)=1, asi que la raiz no importa)
  
  # Estimación de π
  4 * dentro_circulo / n
}

# d) Repetir simulación 100 veces con 100,000 puntos cada vez
set.seed(0)
simulaciones <- 100
n_puntos <- 100000
estimaciones <- replicate(simulaciones, estimar_pi(n_puntos))

# Resultados principales
pi_estimado <- mean(estimaciones)                                 #promedio
error_absoluto <- abs(pi_estimado - pi)                           #comparacion con π, diferencia
error_relativo <- error_absoluto / pi * 100                       #comparacion con π, porcentaje

cat("Estimación promedio de π:", round(pi_estimado, 6), "\n")
cat("Valor real de π:", round(pi, 6), "\n")
cat("Error absoluto promedio:", round(error_absoluto, 6), "\n")
cat("Error relativo promedio:", round(error_relativo, 4), "%\n")

# Visualización de resultados
# Boxplot
boxplot(
  estimaciones,
  main = paste("Estimaciones de π (", simulaciones, "simulaciones)"),
  ylab = "Valor estimado",
  col = "lightyellow")
  abline(h = pi, col = "red", lwd = 2, lty = 2                    #recta en el valor "exacto" de π
)
  
legend("topright", legend = "π real", col = "red", lwd = 2)

# Histograma (alternativa)
hist(estimaciones, 
  breaks = 10,
  main = paste("Distribución de Estimaciones de π (", simulaciones, "simulaciones)"),
  xlab = "Valor estimado",
  ylab = "repeticiones",
  col = "lightblue",
  xlim = c(pi - 0.05, pi + 0.05))
  abline(v = pi, col = "red", lwd = 2
)
  
legend("topright", legend = "π real", col = "red", lwd = 2)

