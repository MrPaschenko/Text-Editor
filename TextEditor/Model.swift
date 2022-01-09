import Foundation

class ObservableArray<T>: ObservableObject {
    @Published var array:[T] = []
    
    init(array: [T]) {
        self.array = array
    }
}

class Note: ObservableObject, Identifiable, Equatable {
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.name == rhs.name && lhs.detail == rhs.detail
    }
    
    var id = UUID()
    @Published var name: String
    @Published var detail: String
    
    init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}

class Notes: ObservableObject {
    @Published var array: [Note]
    
    init(array: [Note]) {
        self.array = array
    }
}
