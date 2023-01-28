# Testing scripts

Testomgeving voor Bash scripts die via Github Actions gelanceerd kan worden. Bedoeling is om scripts, geschreven door studenten, te screenen op:

- bepaalde basisvereisten (bestaan v/h juiste bestand, syntaxcontrole, ShellCheck, ...)
- vereisten in het script (bestaan van bepaalde functies, evt. variabelen, ...)
- smoke tests: script uitvoeren met bepaalde argumenten en exit-status controleren
- functionele tests: uitvoer testen, toestandsveranderingen, ...

Een deel (basisvereisten, bv.) moet herbruikbaar zijn, maar functionele tests moeten natuurlijk script per script bekeken worden.

Het script moet in een geïsoleerde omgeving kunnen werken, daarom wordt het binnen een container uitgevoerd.
