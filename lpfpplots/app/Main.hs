{-# OPTIONS -Wall #-}

import Ch07.PlotYRock20 (yRock20Plot)
import Ch07.PlotYRock30 (yRock30Plot)
import Ch07.QuickPlotting (plot1)
import Ch07.SinPlot (sinPlot)
import Ch08.TypeTrouble (plot1)
import Ch09.RockTrajectory (plot1)
import Ch10.BallSpeed (posBallPlot, speedRateChangeBallPlot)
import Ch11.CosSinPlot (plotCosSin)
import Ch11.PlotPath (plotTXPairs)
import Ch11.ProjectileMotion (plot1, plot1Custom, plot2Custom, plot3Custom, plot4, usePlotFuncs, usePlotFuncs', usePlotPaths)
import Ch11.QuadraticPlot (plotQuadratic)
import Ch11.SinApprox (plotApproxSin)
import Ch14.Newton2 (bikeGraph, bikeGraphSmooth, carGraph, carPosGraph, childGraph, pedalCoastAirGraph, pedalCoastAirPosGraph)
import System.Command
import System.Directory
import System.FilePath.Posix (dropExtension, takeExtension, (</>))

quickPlottingPlot1 :: IO ()
quickPlottingPlot1 = Ch07.QuickPlotting.plot1

typeTroublePlot1 :: IO ()
typeTroublePlot1 = Ch08.TypeTrouble.plot1

rockTrajectoryPlot1 :: IO ()
rockTrajectoryPlot1 = Ch09.RockTrajectory.plot1

projectileMotionPlot1 :: IO ()
projectileMotionPlot1 = Ch11.ProjectileMotion.plot1

projectileMotionPlot2 :: IO ()
projectileMotionPlot2 = Ch11.ProjectileMotion.plot1Custom

projectileMotionPlot3 :: IO ()
projectileMotionPlot3 = Ch11.ProjectileMotion.plot2Custom

projectileMotionPlot4 :: IO ()
projectileMotionPlot4 = Ch11.ProjectileMotion.plot3Custom

projectileMotionPlot5 :: IO ()
projectileMotionPlot5 = Ch11.ProjectileMotion.plot4

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
    quickPlottingPlot1
    sinPlot
    yRock20Plot
    yRock30Plot

    -- Chapter 8
    typeTroublePlot1

    -- Chapter 9
    rockTrajectoryPlot1

    -- Chapter 10
    posBallPlot
    speedRateChangeBallPlot

    -- Chapter 11
    projectileMotionPlot1
    projectileMotionPlot2
    projectileMotionPlot3
    projectileMotionPlot4
    projectileMotionPlot5
    usePlotFuncs
    usePlotFuncs'
    usePlotPaths
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

    files <- getDirectoryContents "plots"
    let epsFilePaths = map ("plots/" </>) (getFilePathsWithExtension files ".eps")
    mapM_ convertEPSToPDF epsFilePaths

    print "Plots finished"
