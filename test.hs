import System.Log.Logger
import System.Log.Handler.TerminalNotifierHandler

main = do
    updateGlobalLogger "Main.Logger" (setLevel DEBUG)
    let hdlr = terminalNotifierHandler "Main.Logger" DEBUG
    updateGlobalLogger rootLoggerName (addHandler hdlr)

    debugM "Main.Logger" "This shows in a growl message with Terminal Icon"
