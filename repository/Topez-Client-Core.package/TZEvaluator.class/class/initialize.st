class initialization
initialize
    "TZGsEvaluator initialize.
	TZNativeEvaluator initialize"

    commands := Dictionary new.
    subCommands := Dictionary new.
    self
        debuggerCmds;
        editCmds;
        findCmds;
        listCmds;
        mczCmds;
        runCmds;
        statusCmds;
        installNodes;
        nodeCmds;
        demoCmds;
        yourself	"demoCmds shoud be last, since it replaces soem commands"