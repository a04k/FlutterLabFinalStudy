
🐝 HIVE QUICK REFERENCE – FLUTTER/DART

-----------------------
🔓 BOX OPERATIONS
-----------------------
await Hive.openBox('boxName');                    Open box (untyped)
await Hive.openBox<MyModel>('myBox');             Open typed box
await box.close();                                Close box
Hive.isBoxOpen('boxName');                        Check if box is open

-----------------------
➕ ADD / PUT
-----------------------
box.add('Hello');                                 Add value (auto index)
box.put('key', 'Hello');                          Add or overwrite by key
box.putAt(0, 'Updated');                          Overwrite at index

-----------------------
📤 GET
-----------------------
box.get('key');                                   Get by key
box.getAt(0);                                     Get by index

-----------------------
🗑️ DELETE
-----------------------
box.delete('key');                                Delete by key
box.deleteAt(0);                                  Delete by index

-----------------------
🧼 OTHER
-----------------------
box.clear();                                      Clear all entries
box.length;                                       Number of entries
box.keys;                                         List of keys
box.values;                                       List of values

-----------------------
🔁 LISTENABLE (UI)
-----------------------
ValueListenableBuilder(
  valueListenable: box.listenable(),
  builder: (context, box, _) {
    Rebuilds UI on change
  },
);

-----------------------
🧬 OBJECT METHODS
(for HiveObject classes)
-----------------------
item.save();                                      Save changes
item.delete();                                    Delete self

-----------------------
⚙️ SETUP
-----------------------
Hive.registerAdapter(MyModelAdapter());           Register your adapter

Run code generator (once):
dart run build_runner build --delete-conflicting-outputs

