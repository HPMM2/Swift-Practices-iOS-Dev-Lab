import SwiftUI

struct WelcomePageView: View {
    var body: some View {
        VStack {
            ZStack{
                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(Color.white)
                    .opacity(0.5)

                RoundedRectangle(cornerRadius: 50)
                    .frame(width: 150, height: 150)
                    .foregroundStyle(Color.mint)
                    .opacity(0.5)

                
                Image(systemName: "cloud.rainbow.crop.fill")
                    .symbolRenderingMode(.multicolor)
                    .font(.system(size: 80))
                    .foregroundStyle(Color.white)
                    //.opacity()
            }
            Text("Papuchin Zone")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("Mi coneja se llama Papuchin")
                .font(.title2)
        }
        .padding()
        
    }  
}


#Preview {
    WelcomePageView()
}
