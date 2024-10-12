import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var textFieldText: String = ""
    
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Add an Item 🖋️")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top)
                
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.bottom, 8) // Additional bottom padding for spacing
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(16)
            .alert(isPresented: $showAlert, content: getAlert)
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.isEmpty {
            alertTitle = "So your todo is, what, literally nothing? 🤔"
            showAlert.toggle()
            return false
        }
        if textFieldText.count < 3 {
            alertTitle = "Your todo item must be at least 3 characters!!! 😨😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

// Preview
#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModel())
}
