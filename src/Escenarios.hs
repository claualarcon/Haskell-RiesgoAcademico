module Escenarios
    ( mejorarProgreso
    , mejorarAsistencia
    , reducirInasistencias
    ) where

import Modelo


mejorarProgreso :: Double -> Estudiante -> Estudiante
mejorarProgreso incremento estudiante =
    estudiante
        { progresoAcademico =
            min 100 (progresoAcademico estudiante + incremento)
        }


mejorarAsistencia :: Double -> Estudiante -> Estudiante
mejorarAsistencia incremento estudiante =
    estudiante
        { asistencia =
            min 100 (asistencia estudiante + incremento)
        }


reducirInasistencias :: Int -> Estudiante -> Estudiante
reducirInasistencias cantidad estudiante =
    estudiante
        { inasistencias =
            max 0 (inasistencias estudiante - cantidad)
        }