import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
                .font(.title) // Increase icon size for better visibility

            Text(item.title)
                .fontWeight(item.isCompleted ? .bold : .regular) // Bold completed items
                .foregroundColor(item.isCompleted ? .gray : .primary) // Change text color based on completion

            Spacer()
            
            if item.isCompleted {
                // Optionally show a completed label or date
                Text("Completed")
                    .font(.caption)
                    .foregroundColor(.gray)
                    .padding(5)
                    .background(Color.green.opacity(0.2)) // Subtle background for completed label
                    .cornerRadius(5)
            }
        }
        .padding(.vertical, 10) // Adjust vertical padding
        .padding(.horizontal) // Add horizontal padding for better spacing
        .background(Color(UIColor.systemBackground)) // Row background color
        .cornerRadius(10) // Rounded corners for the row
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2) // Adding shadow for depth
    }
}

// Preview
#Preview {
    Group {
        ListRowView(item: ItemModel(title: "This is the first item", isCompleted: false))
        ListRowView(item: ItemModel(title: "This is the second item", isCompleted: true))
    }
}
