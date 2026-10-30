
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

mostrarResultado :: Estudiante -> String -> Estudiante -> IO ()
mostrarResultado inicial descripcion estudiante = do
    putStrLn descripcion
    putStrLn ("  Puntaje: " ++ show (puntajeTotal estudiante))
    putStrLn ("  Cambio: " ++ mostrarCambio
        (puntajeTotal estudiante - puntajeTotal inicial))
    putStrLn ("  Riesgo: " ++ show (evaluarRiesgo estudiante))
    putStrLn ""

mostrarCambio :: Int -> String
mostrarCambio cambio
    | cambio < 0 = "Disminuyo " ++ show (abs cambio) ++ " puntos"
    | cambio > 0 = "Aumento " ++ show cambio ++ " puntos"
    | otherwise  = "Sin cambios"

mostrarEscenarios
    :: Estudiante
    -> String
    -> [(String, Estudiante)]
    -> IO ()
mostrarEscenarios inicial titulo escenarios = do
    putStrLn titulo
    putStrLn ""
    mapM_ (uncurry (mostrarResultado inicial)) escenarios

mostrarSensibilidadProgreso :: [Double] -> Estudiante -> IO ()
mostrarSensibilidadProgreso valores inicial = do
    mapM_ probar valores
    where
        probar valor = do
            let estudiante = inicial
                    { progresoAcademico = valor }

            putStrLn
                ("Progreso: " ++ show valor ++ "%"
                ++ " | Puntaje del progreso: "
                ++ show (puntajeProgreso valor)
                ++ " | Puntaje total: "
                ++ show (puntajeTotal estudiante)
                ++ " | Riesgo: "
                ++ show (evaluarRiesgo estudiante))

main :: IO ()
main = do
    putStrLn "=== MODELO FUNCIONAL DE RIESGO ACADEMICO ==="
    putStrLn ""

    putStrLn "ESTUDIANTE INICIAL"
    print estudiante1
    putStrLn ("Puntaje: " ++ show (puntajeTotal estudiante1))
    putStrLn ("Riesgo: " ++ show (evaluarRiesgo estudiante1))
    putStrLn ""

    let incrementosProgreso = [10, 20, 30]
    let estudiantesProgreso =
            escenariosProgreso incrementosProgreso estudiante1
    let resultadosProgreso =
            zipWith
                (\incremento estudiante ->
                    ("Progreso +" ++ show incremento ++ "%", estudiante))
                incrementosProgreso
                estudiantesProgreso

    mostrarEscenarios estudiante1
        "EXPERIMENTO 1: PROGRESO ACADEMICO"
        resultadosProgreso

    let incrementosAsistencia = [10, 20, 30]
    let estudiantesAsistencia =
            escenariosAsistencia incrementosAsistencia estudiante1
    let resultadosAsistencia =
            zipWith
                (\incremento estudiante ->
                    ("Asistencia +" ++ show incremento ++ "%", estudiante))
                incrementosAsistencia
                estudiantesAsistencia

    mostrarEscenarios estudiante1
        "EXPERIMENTO 2: ASISTENCIA"
        resultadosAsistencia

    let reduccionesInasistencias = [1, 2, 3]
    let estudiantesInasistencias =
            escenariosInasistencias reduccionesInasistencias estudiante1
    let resultadosInasistencias =
            zipWith
                (\reduccion estudiante ->
                    ("Reducir " ++ show reduccion ++ " inasistencia(s)", estudiante))
                reduccionesInasistencias
                estudiantesInasistencias

    mostrarEscenarios estudiante1
        "EXPERIMENTO 3: REDUCCION DE INASISTENCIAS"
        resultadosInasistencias

    putStrLn "ANALISIS DE SENSIBILIDAD DEL PROGRESO"
    putStrLn ""

    mostrarSensibilidadProgreso
        [28, 29, 30, 31, 48, 49, 50, 51, 68, 69, 70, 71]
        estudiante1