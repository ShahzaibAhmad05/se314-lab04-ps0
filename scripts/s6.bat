java -version
java -jar ..\tools\ecj.jar -8 -nowarn -d bin -cp ..\tools\junit-4.13.2.jar src
java -cp bin rules.RulesOf6005
