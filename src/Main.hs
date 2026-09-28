module Main where

import Modelo
import Riesgo
import Escenarios


estudiante1 :: Estudiante
estudiante1 = Estudiante
    { progresoAcademico = 25
    , asistencia = 55
    , inasistencias = 7
    , aniosCarrera = 3
    , intervenciones = 1
    , dificultadAprendizaje = True
    , derivacionDocente = False
    , tesisPendiente = False
    }


main :: IO ()
main = do
    putStrLn "=== MODELO DE RIESGO ACADEMICO ==="
    putStrLn ""

    putStrLn "ESCENARIO INICIAL"
    print estudiante1
    putStrLn ("Puntaje: " ++ show (puntajeTotal estudiante1))
    putStrLn ("Riesgo: " ++ show (evaluarRiesgo estudiante1))

    putStrLn ""

    putStrLn "ESCENARIO 1: +10% DE PROGRESO"
    let escenario1 = mejorarProgreso 10 estudiante1
    print escenario1
    putStrLn ("Puntaje: " ++ show (puntajeTotal escenario1))
    putStrLn ("Riesgo: " ++ show (evaluarRiesgo escenario1))

    putStrLn ""

    putStrLn "ESCENARIO 2: +20% DE PROGRESO"
    let escenario2 = mejorarProgreso 20 estudiante1
    print escenario2
    putStrLn ("Puntaje: " ++ show (puntajeTotal escenario2))
    putStrLn ("Riesgo: " ++ show (evaluarRiesgo escenario2))

    putStrLn ""

    putStrLn "ESCENARIO 3: +30% DE PROGRESO"
    let escenario3 = mejorarProgreso 30 estudiante1
    print escenario3
    putStrLn ("Puntaje: " ++ show (puntajeTotal escenario3))
    putStrLn ("Riesgo: " ++ show (evaluarRiesgo escenario3))

    putStrLn ""

    putStrLn "ESCENARIO 4: +10% DE ASISTENCIA"
    let escenario4 = mejorarAsistencia 10 estudiante1
    print escenario4
    putStrLn ("Puntaje: " ++ show (puntajeTotal escenario4))
    putStrLn ("Riesgo: " ++ show (evaluarRiesgo escenario4))

    putStrLn ""

    putStrLn "ESCENARIO 5: -2 INASISTENCIAS"
    let escenario5 = reducirInasistencias 2 estudiante1
    print escenario5
    putStrLn ("Puntaje: " ++ show (puntajeTotal escenario5))
    putStrLn ("Riesgo: " ++ show (evaluarRiesgo escenario5))