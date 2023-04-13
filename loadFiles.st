Smalltalk startUpScriptArguments do: [:fileName |
    ChangeSet fileIn: (fileName asFileEntry)].