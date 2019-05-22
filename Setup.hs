import Distribution.Simple
import Distribution.Verbosity
import Distribution.Simple.Utils
import System.Directory (doesFileExist)

prepareBuild =
    do
        ok <- doesFileExist "freetype-gl/CMakeLists.txt"
        if ok
            then
                -- Nix based builds automatically update the submodules,
                -- so updating them is not necessary.
                -- More-over, they fail if finding a .git folder,
                -- hence avoiding invocations of git is necessary.
                return ()
            else
                -- Stack/cabal based builds require updating the submodules
                rawSystemExit normal "git" ["submodule", "update", "--init", "--recursive"]

main =
    defaultMainWithHooks simpleUserHooks
    { preBuild = \args buildFlags ->
          do
              prepareBuild
              preBuild simpleUserHooks args buildFlags
    }
