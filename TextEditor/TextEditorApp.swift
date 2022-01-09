import SwiftUI

@main
struct TextEditorApp: App {
    @State var notes: ObservableArray<Note> = ObservableArray(array: [])
    
    var body: some Scene {
        WindowGroup {
            ListView()
            .environmentObject(notes)
        }
    }
}
