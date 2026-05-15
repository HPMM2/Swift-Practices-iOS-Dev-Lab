import SwiftUI

struct FeaturePageView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "sun.rain.fill")
                    .symbolRenderingMode(.multicolor)
                Text ("Rainy")
            }
            .padding()

            .background(Color.mint, in:
                            RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(Color.white)
            .border(Color.cyan, width: 2) 
            .cornerRadius(15)
        }
        
    }  
}


#Preview {
    FeaturePageView()
}
