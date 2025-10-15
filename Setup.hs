{-# LANGUAGE CPP #-}

import Distribution.Verbosity
import Distribution.Simple
import Distribution.Simple.Setup
import Distribution.Simple.Utils
import Distribution.System
import System.Directory (doesFileExist)

-- Compatibility wrapper for rawSystemExit
rawSystemExitCompat :: Verbosity -> String -> [String] -> IO ()
#if MIN_VERSION_Cabal(3,13,0)
rawSystemExitCompat verbosity = rawSystemExit verbosity Nothing
#else
rawSystemExitCompat = rawSystemExit
#endif

prepareBuild :: Verbosity -> IO ()
prepareBuild verbosity =
    do
        ok <- doesFileExist "freetype-gl/CMakeLists.txt"
        if ok
            then
                -- Nix and future versions of Stack automatically update the submodules,
                -- so updating them is not necessary.
                -- More-over, they fail if finding a .git folder,
                -- hence avoiding invocations of git is necessary.
                return ()
            else
            -- Stack/cabal based builds currently require updating the submodules
            if buildOS == Windows
            then rawSystemExitCompat verbosity "stack" ["exec", "--", "bash", "prepare_submodule.sh"]
            else rawSystemExitCompat verbosity "bash" ["prepare_submodule.sh"]

main =
    defaultMainWithHooks simpleUserHooks
    { preBuild = \args buildFlags ->
        do
            let verbosity = fromFlagOrDefault normal $ buildVerbosity buildFlags
            prepareBuild verbosity
            preBuild simpleUserHooks args buildFlags
    }
