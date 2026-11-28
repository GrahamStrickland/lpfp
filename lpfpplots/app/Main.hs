{-# OPTIONS -Wall #-}

import Ch07.PlotYRock20 (yRock20Plot)
import Ch07.PlotYRock30 (yRock30Plot)
import Ch07.SinPlot (sinPlot)
import Ch09.RockTrajectory (plot1)
import Ch10.BallSpeed (posBallPlot, speedRateChangeBallPlot)
import Ch11.CosSinPlot (plotCosSin)
import Ch11.PlotPath (plotTXPairs)
import Ch11.QuadraticPlot (plotQuadratic)
import Ch11.SinApprox (plotApproxSin)
import Ch14.Newton2 (bikeGraph, bikeGraphSmooth, carGraph, carPosGraph, childGraph, eulerDEPlot, eulerPlot, pedalCoastAirGraph, pedalCoastAirPosGraph)
import Ch15.Mechanics1D (dampedHOGraph, dampedHOGraph3, ballGraph, linearSpringGraph, dropVelocityTimeGraph, dropVelocityTimeGraph2, dropVelocityPositionGraph, dropVelocityPositionGraph2, linearSpringComparisonGraph, springFrictionPositionGraph, ljGraph, ljGraph2)
import System.Command
import System.Directory
import System.FilePath.Posix (dropExtension, takeExtension, (</>))

rockTrajectoryPlot1 :: IO ()
rockTrajectoryPlot1 = Ch09.RockTrajectory.plot1

carGraphPlot :: IO ()
carGraphPlot = Ch14.Newton2.carGraph

carPosGraphPlot :: IO ()
carPosGraphPlot = Ch14.Newton2.carPosGraph

childGraphPlot :: IO ()
childGraphPlot = Ch14.Newton2.childGraph

bikeGraphPlot :: IO ()
bikeGraphPlot = Ch14.Newton2.bikeGraph

pedalCoastAirGraphPlot :: IO ()
pedalCoastAirGraphPlot = Ch14.Newton2.pedalCoastAirGraph

pedalCoastAirPosGraphPlot :: IO ()
pedalCoastAirPosGraphPlot = Ch14.Newton2.pedalCoastAirPosGraph

bikeGraphSmoothPlot :: IO ()
bikeGraphSmoothPlot = Ch14.Newton2.bikeGraphSmooth

eulerGraphPlot :: IO ()
eulerGraphPlot = Ch14.Newton2.eulerPlot

eulerDEGraphPlot :: IO ()
eulerDEGraphPlot = Ch14.Newton2.eulerDEPlot

dampedHOGraphPlot :: IO ()
dampedHOGraphPlot = Ch15.Mechanics1D.dampedHOGraph

dampedHOGraphPlot3 :: IO ()
dampedHOGraphPlot3 = Ch15.Mechanics1D.dampedHOGraph3

ballGraphPlot :: IO ()
ballGraphPlot = Ch15.Mechanics1D.ballGraph

linearSpringGraphPlot :: IO ()
linearSpringGraphPlot = Ch15.Mechanics1D.linearSpringGraph

dropVelocityTimeGraphPlot :: IO ()
dropVelocityTimeGraphPlot = Ch15.Mechanics1D.dropVelocityTimeGraph

dropVelocityTimeGraphPlot2 :: IO ()
dropVelocityTimeGraphPlot2 = Ch15.Mechanics1D.dropVelocityTimeGraph2

dropVelocityPositionGraphPlot :: IO ()
dropVelocityPositionGraphPlot = Ch15.Mechanics1D.dropVelocityPositionGraph

dropVelocityPositionGraphPlot2 :: IO ()
dropVelocityPositionGraphPlot2 = Ch15.Mechanics1D.dropVelocityPositionGraph2

linearSpringComparisonGraphPlot :: IO ()
linearSpringComparisonGraphPlot = Ch15.Mechanics1D.linearSpringComparisonGraph

springFrictionPositionGraphPlot :: IO ()
springFrictionPositionGraphPlot = Ch15.Mechanics1D.springFrictionPositionGraph

ljGraphPlot :: IO ()
ljGraphPlot = Ch15.Mechanics1D.ljGraph

ljGraphPlot2 :: IO ()
ljGraphPlot2 = Ch15.Mechanics1D.ljGraph2

filePathHasExtension :: String -> FilePath -> Bool
filePathHasExtension ext f = takeExtension f == ext

getFilePathsWithExtension :: [FilePath] -> String -> [FilePath]
getFilePathsWithExtension files ext = filter (filePathHasExtension ext) files

convertEPSToPDF :: FilePath -> IO ()
convertEPSToPDF f = command [] "ps2pdf" ["-dEPSCrop", f, dropExtension f ++ ".pdf"]

main :: IO ()
main = do
    createDirectoryIfMissing False "plots"

    -- Chapter 7
    sinPlot
    yRock20Plot
    yRock30Plot

    -- Chapter 9
    rockTrajectoryPlot1

    -- Chapter 10
    posBallPlot
    speedRateChangeBallPlot

    -- Chapter 11
    plotQuadratic
    plotCosSin
    plotApproxSin
    plotTXPairs

    -- Chapter 14
    carGraphPlot
    carPosGraphPlot
    childGraphPlot
    bikeGraphPlot
    pedalCoastAirGraphPlot
    bikeGraphSmoothPlot
    pedalCoastAirPosGraphPlot
    eulerGraphPlot
    eulerDEGraphPlot

    -- Chapter 15
    dampedHOGraphPlot
    dampedHOGraphPlot3
    ballGraphPlot
    linearSpringGraphPlot
    dropVelocityTimeGraphPlot
    dropVelocityTimeGraphPlot2
    dropVelocityPositionGraphPlot
    dropVelocityPositionGraphPlot2
    linearSpringComparisonGraphPlot
    springFrictionPositionGraphPlot
    ljGraphPlot
    ljGraphPlot2

    files <- getDirectoryContents "plots"
    let epsFilePaths = map ("plots/" </>) (getFilePathsWithExtension files ".eps")
    mapM_ convertEPSToPDF epsFilePaths

    print "Plots finished"
