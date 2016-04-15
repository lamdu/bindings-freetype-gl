import Distribution.Simple
import Distribution.Verbosity
import Distribution.Simple.Utils

prepareBuild =
    rawSystemExit normal "git" ["submodule", "update", "--init", "--recursive"]

main =
    defaultMainWithHooks simpleUserHooks
    { preBuild = \args buildFlags ->
          do
              prepareBuild
              preBuild simpleUserHooks args buildFlags
    }
