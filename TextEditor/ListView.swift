import SwiftUI

struct ListView: View {
    @EnvironmentObject var notes: ObservableArray<Note>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(notes.array) { note in
                    NavigationLink(destination: DetailNoteView()
                                    .environmentObject(note)
                                    .environmentObject(notes)) {
                        VStack(alignment: .leading) {
                            Text(note.name)
                                .font(.headline)
                            Text(note.detail)
                                .font(.body)
                        }
                    }
                }
            }
            .navigationTitle("Список заметок")
            .toolbar {
                NavigationLink(destination: AddNoteView().environmentObject(notes))
                {
                    Text("Добавить")
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
