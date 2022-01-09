import SwiftUI
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
struct AddNoteView: View {
    @EnvironmentObject var notes: ObservableArray<Note>
    
    @State var tempName = ""
    @State var tempDetail = ""
    @State var selectedTextColor = Color.black
    @State var selectedBackgroundColor = Color.yellow
    
    var body: some View {
        VStack {
            TextField("Название", text: $tempName)
                .frame(height: 50)
            
            TextEditor(text: $tempDetail)
                .frame(height: 250)
                .foregroundColor(selectedTextColor)
                .colorMultiply(selectedBackgroundColor)
                .cornerRadius(10)
            
            ColorPicker("Выберите цвет текста:", selection: $selectedTextColor)
            ColorPicker("Выберите цвет фона:", selection: $selectedBackgroundColor)
            
            Button {
                hideKeyboard()
                notes.array.append(Note(name: tempName, detail: tempDetail))
            } label: {
                Text("Сохранить".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
            Button {
                UIPasteboard.general.string = tempDetail
            } label: {
                Text("Скопировать в буфер обмена".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Добавление заметки")
    }
}
struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
