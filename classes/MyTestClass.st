!classDefinition: #ExampleTest category: 'MyTestClass'!
TestCase subclass: #ExampleTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MyTestClass'!

!ExampleTest methodsFor: 'as yet unclassified' stamp: 'jb 4/5/2023 13:46:31'!
test01ExampleReturns3
	self assert: CustomClass new example equals: 3 ! !
