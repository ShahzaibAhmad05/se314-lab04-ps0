java -jar ..\tools\ecj.jar -8 -nowarn -d bin -cp ..\tools\junit-4.13.2.jar src
java -cp "bin;..\tools\junit-4.13.2.jar;..\tools\hamcrest-core-1.3.jar" org.junit.runner.JUnitCore rules.RulesOf6005Test
