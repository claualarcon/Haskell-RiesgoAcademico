# Modelo funcional exploratorio para el análisis del riesgo académico

Trabajo Práctico Integrador de Programación Funcional\
Doctorado en Informática\
Integrantes: Claudia Alarcón y Helena Vallejos\
Implementación: Haskell

## Descripción

Este proyecto implementa un prototipo funcional exploratorio que
representa un estudiante mediante variables académicas, calcula un
puntaje basado en reglas explícitas y clasifica el resultado en cuatro
niveles: Bajo, Medio, Alto y Crítico.

Permite generar escenarios alternativos modificando el progreso
académico, la asistencia y la cantidad de inasistencias, y analizar la
sensibilidad del puntaje ante valores cercanos a determinados umbrales.

**Importante:** las reglas, ponderaciones y umbrales son supuestos
definidos para este prototipo. No constituyen un modelo predictivo
validado, no fueron entrenados con datos institucionales reales y no
deben utilizarse para tomar decisiones sobre estudiantes.

## Estructura del proyecto

-   `Main.hs`: construye el caso de prueba, ejecuta los experimentos y
    muestra los resultados.
-   `Modelo.hs`: define los tipos `Estudiante` y `NivelRiesgo`.
-   `Riesgo.hs`: contiene las funciones de puntuación parcial, cálculo
    del puntaje total y clasificación.
-   `Escenarios.hs`: implementa las transformaciones utilizadas para
    generar escenarios alternativos.
-   `riesgo-academico-funcional.cabal`: describe el ejecutable y los
    módulos del proyecto.

## Requisitos

-   GHC (Glasgow Haskell Compiler).
-   Cabal.
-   Ambos comandos deben estar disponibles desde una terminal.

## Compilación y ejecución

Desde la carpeta raíz del proyecto, ejecutar:

``` bash
cabal build
```

Luego:

``` bash
cabal run riesgo-academico-funcional
```

El programa muestra el estudiante inicial, su puntaje y nivel de riesgo,
los escenarios de variación del progreso académico, la asistencia y las
inasistencias, y el análisis de sensibilidad del progreso.

## Organización funcional

La implementación separa la representación de los datos, las reglas de
evaluación, la generación de escenarios y la presentación de resultados.
Se utilizan funciones puras, actualización inmutable de registros y
operaciones sobre listas, entre ellas `map` y `zipWith`.

## Alcance y limitaciones

-   El caso utilizado es ilustrativo.
-   Los resultados dependen de las reglas y umbrales definidos en el
    código.
-   Las reglas no cuentan con validación empírica.
-   El prototipo permite explorar el comportamiento del modelo, pero no
    demostrar causalidad ni predecir el desempeño académico real.
-   La variable `aniosCarrera` está representada, pero no interviene en
    el cálculo del puntaje en esta versión.
-   La ponderación de la cantidad de intervenciones requiere revisión
    conceptual.

## Reproducibilidad

Para reproducir los resultados, compilar y ejecutar el proyecto con los
comandos indicados. No se requieren datos institucionales externos para
ejecutar el caso de prueba incluido.
