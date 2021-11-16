// Listen for all updates on the VAERS data set
// and display any modifications to the console.

db = db.getSiblingDB('VAERS');
collection = db.data;

//const changeStreamCursor = collection.watch( [ { $match : {"operationType" : "update" } } ] );
const changeStreamCursor = collection.watch();

print("");
print ("Listening for updates...");

pollStream(changeStreamCursor);

// Never executes.
print("Never reached.");

//this function polls a change stream and prints out each change as it comes in
function pollStream(cursor) {

  while (!cursor.isExhausted()) {

    if (cursor.hasNext()) {

      var change = cursor.next();
      print(JSON.stringify(change));
      print();

    }

  }

  print("polling again");
  pollStream(cursor);

}

