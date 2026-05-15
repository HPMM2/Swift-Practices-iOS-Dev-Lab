import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Yo soy...")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Image("pp1.2")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle() .stroke(.mint, style: StrokeStyle(lineWidth: 10))
                 )
            Text("Heidi Martinez")
                .font(.largeTitle)
                .foregroundStyle(.mint)
                .padding(15)
                .background(Color.white)
                .cornerRadius(45)
            
            HStack{
                Image(systemName: "questionmark.ar")
                    .symbolRenderingMode(.multicolor)
                    .padding()
                    .font(.largeTitle)
                Text("Papuchin")
                    .foregroundStyle(.black)
                    .padding()
                    .font(.largeTitle)
                    .background(Color.white)
                    .cornerRadius(30)
                Image(systemName: "questionmark")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                    .padding()
                    .font(.largeTitle)
            }
        }
        
        .padding()
        .background(Image("fondo3.3").opacity(0.5))
        .scaledToFit()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View{
        HomeView()
    }
}
