api
defineData: aPackage
	methods := aPackage
		flatCollect: [ :p | 
			p methods
				reject: [ :meth | meth isTestMethod or: meth methodClass isTestCase ] ].
"	testClasses := aDTpluginConfiguration packagesSelected
		flatCollect: [ :p | p classes ]."
	link := MetaLink new
		selector: #tagExecuted;
		metaObject: #node