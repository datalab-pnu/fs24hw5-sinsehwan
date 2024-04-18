//for class Person
Person p;
FixedFieldBuffer buffer;
RecordFile pFile(buffer);
PFile.Read(p);

//for class Recording, explained in Ch.7
Recording r;
RecordFile rFile;
RFile.Read (r );


FixedFieldBuffer buffer;
RecordFile <Person> PersonFile (buffer);
Person person;
PersonFile.Create("person.dat", ios::in);
PersonFile.Read(person);
PersonFile.Append(person);


rFile.Read(r)

