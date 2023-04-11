Smalltalk startUpScriptArguments do: [:fileName | 
    (AutomatedCodeFile newFromFile: (fileName asFileEntry)) fileIn].