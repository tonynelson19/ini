<cfset filePath = expandPath("config.ini") />

<cfset testSuite = new mxunit.runner.DirectoryTestSuite() />

<cfset results = testSuite.run(directory=expandPath('/ini/test/'), recurse=true, componentPath="ini.test.") />

<cfoutput>
#results.getHTMLResults()#
</cfoutput>