class Library {
  List<Books> book = [];
}

class Books {
  late int id;
  late int qty;
  late String name;
  late String type;

  Books({
    required this.id,
    required this.qty,
    required this.name,
    required this.type,
  });

  void bookDetails() {
    print('$id - $name - $qty');
  }

  @override
  String toString() {
    return '\nBooks{\n id: $id,\n qty: $qty,\n name: $name,\n type: $type\n}';
  }
}

class CommBook extends Books {
  CommBook({id, name, qty}) : super(id: id, name: name, qty: qty, type: 'Comm');

  @override
  void bookDetails() {
    print('CommBook $id - $name - $qty');
  }
}

class EngBook extends Books {
  EngBook({id, name, qty}) : super(id: id, name: name, qty: qty, type: 'Engg');
  @override
  void bookDetails() {
    print('EngBook $id - $name - $qty');
  }
}

void main() {
  Library lib = Library();
  lib.book.add(EngBook(id: 1, name: 'Name2', qty: 5));
  lib.book.add(CommBook(id: 1, name: 'Name1', qty: 5));
  print(lib.book);
}
