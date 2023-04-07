Utilities setAuthorName: 'algo3' initials: 'algo3'.
stringTestClasses := Smalltalk startUpScriptArguments.

testClasses := Smalltalk classes select: [:class | stringTestClasses includes: class asString].

testSuite := TestSuite new.
testClasses do: [:testClass | testClass addToSuiteFromSelectors: testSuite].
suiteResults := testSuite run.

stdout := StdIOWriteStream stdout.
stdout nextPutAll: (suiteResults asString); newLine.

Smalltalk quit.