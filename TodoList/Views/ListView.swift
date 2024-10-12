import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
        
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
                    .padding()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                .padding(.top) // Adds padding to the top of the list
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
        .background(Color(UIColor.systemGroupedBackground)) // Change the background color
        .edgesIgnoringSafeArea(.bottom) // Extend the background color to the bottom
    }
}

// Preview
#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
}
