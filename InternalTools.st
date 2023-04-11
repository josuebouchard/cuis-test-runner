!classDefinition: #AutomatedCodeFile category: 'InternalTools'!
CodeFile subclass: #AutomatedCodeFile
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'InternalTools'!

!AutomatedCodeFile methodsFor: 'as yet unclassified' stamp: 'algo3 4/11/2023 12:07:33'!
fileIn
	classOrder do:[:cls|
		cls fileInDefinition.
	].
	classes do:[:cls|
		(Preferences at: #transcriptLogVerbose) ifTrue: [
			Transcript newLine; show:'Filing in ', cls name].
		cls fileInMethods.
		cls hasMetaclass ifTrue:[cls theMetaClass fileInMethods].
	].
	self fileInDoits.! !
