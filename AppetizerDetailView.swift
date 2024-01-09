

import SwiftUI
import PopupView


struct AppetizerDetailView: View{
    let appetizer: Appetizer
    
    var body: some View{
        VStack(spacing: 8){
            
            Image(appetizer.imageURL)
                .resizable()
                .scaledToFit()
            

            Text(appetizer.name)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(appetizer.description)
                .multilineTextAlignment(.center)
                .font(.body)
                .padding()
            HStack(spacing: 20){
                VStack{
                    Text("Calories")
                        .font(.caption)
                    Text("\(appetizer.calories, specifier: "%d")")
                        .font(.subheadline)
                        .italic()
                }
                VStack{
                    Text("Carbs")
                        .font(.caption)
                    Text("\(appetizer.calories, specifier: "%d")")
                        .font(.subheadline)
                        .italic()
                }
                VStack{
                    Text("Protein")
                        .font(.caption)
                    Text("\(appetizer.calories, specifier: "%d")")
                        .font(.subheadline)
                        .italic()
                }
            }
            Spacer()
            AddToOrderButton(appetizer: appetizer)
        }
        .frame(width: 300, height: 500, alignment: .top)
        .background(Color(.systemBackground))
        .cornerRadius(14)
        .shadow(radius: 40)
        .overlay(xDismissButton(), alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer)
}
