module System.Log.Handler.TerminalNotifierHandler (terminalNotifierHandler) where

import System.Log (Priority)
import System.Log.Handler (LogHandler(..))
import System.Log.Formatter (nullFormatter, LogFormatter(..))
import System.Cmd (rawSystem)

data TerminalNotifierHandler = TerminalNotifierHandler
    { priority :: Priority
    , formatter :: LogFormatter TerminalNotifierHandler
    , appName :: String
    }

instance LogHandler TerminalNotifierHandler where
    setLevel tnh p = tnh { priority = p }

    getLevel = priority

    setFormatter gh f = gh { formatter = f }
    getFormatter = formatter

    emit tnh (prio, msg) _ = do
        rawSystem "terminal-notifier" ["-message", (show prio) ++ "\n" ++ msg]
        return ()
    close tnh     = return ()

terminalNotifierHandler :: String -> Priority -> TerminalNotifierHandler
terminalNotifierHandler service priority = TerminalNotifierHandler priority nullFormatter service
