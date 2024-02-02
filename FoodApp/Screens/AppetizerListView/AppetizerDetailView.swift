

import SwiftUI
import PopupView


struct AppetizerDetailView: View{
    let appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    var body: some View{
        VStack(spacing: 8){
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            

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
                .padding()
        }
        .frame(width: 300, height: 500, alignment: .top)
        .background(Color(.systemBackground))
        .cornerRadius(14)
        .shadow(radius: 40)
        .overlay(xDismissButton(isShowingDetailView: $isShowingDetailView), alignment: .topTrailing)
        
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(false))
}
