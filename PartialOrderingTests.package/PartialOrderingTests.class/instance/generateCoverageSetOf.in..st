as yet unclassified
generateCoverageSetOf: aTestCase in: aPackage
	| executedMethods result |
	result := ItemTest new.
	self defineData: aPackage.
	[ methods do: [ :meth | meth ast link: link ].
	[ "ExampleSetTest run: #testRemove" (aTestCase definedClass) run: aTestCase selector ]
		ensure: [ link uninstall ] ] valueUnpreemptively.
	executedMethods := methods
		collect: [ :each | each ast hasBeenExecuted ].
	result coverageSet: executedMethods.
	result test: aTestCase.
	"cleanup the annotations"
	methods
		do: [ :each | each ast removeProperty: #tagExecuted ifAbsent: [  ] ].
	^ result