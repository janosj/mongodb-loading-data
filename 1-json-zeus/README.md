# Loading JSON

JSON can be loaded directly into MongoDB without having to define any schema in advance. Simply load the JSON and start analyzing.

This example data set is related to the Zeus malware package, and infamous botnet that was able to steal passwords through keystroke logging. The related use case here would be computer networks and cybercrime.

To see what the data looks like, use *zeus1.pretty.json*, which contains a single document from the collection. Next, load up the *zeus-subset.json* data file and use MongoDB Compass (or the mongo shell) to display the results. Issue one or two queries (especially on one of the array values) to see that MongoDB has full visibility into the data, without ever having to explicitly define the document schema. 

