import SwiftUI

struct NoItemsView: View {
    
    @State private var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor") // Ensure you have this color in your asset catalog
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? Add items to your todo list!")
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add something 🥳")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? secondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                            .shadow(color: animate ? secondaryAccentColor.opacity(0.7) : Color.accentColor.opacity(0.7), radius: animate ? 20 : 10, x: 0, y: animate ? 20 : 10)
                            .scaleEffect(animate ? 1.05 : 1.0) // Slightly reduce scaling effect
                            .offset(y: animate ? -7 : 0)
                            .padding(.horizontal, animate ? 30 : 50)
                    }
                )
            }
            .frame(maxWidth: 400)
            .padding(40)
            .onAppear(perform: addAnimation)
            .padding(.top, 40) // Added top padding for better spacing
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemGroupedBackground)) // Optional: Background color for better contrast
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.0)
                    .repeatForever(autoreverses: true) // Makes the animation smoother
            ) {
                animate.toggle()
            }
        }
    }
}

// Preview
#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("No Items")
    }
}
