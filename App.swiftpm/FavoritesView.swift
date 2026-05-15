import SwiftUI

struct FavoritesView: View {
    var body: some View {
        VStack {
            Text("Favoritos")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 40)
            HStack{
                Text("Pasatiempos")
                    .font(.title2)
                Spacer()
            }
            .padding(.leading)
            
            HStack(spacing: 20){
                Text("🐰")
                    .font(.system(size: 40))
                Text("👾")
                    .font(.system(size: 40))
                Text("🍱")
                    .font(.system(size: 40))
            }
            
            .padding()
            Divider()
            
            HStack{
                Text("Comidas")
                    .font(.title2)
                Spacer()
                
            }
            .padding([.top, .leading])
            ScrollView(.horizontal){
                HStack(spacing:30) {
                    Text("🍔")
                        .font(.system(size: 40))
                    Text("🍙")
                        .font(.system(size: 40))
                    Text("🍰")
                        .font(.system(size: 40))
                    Text("🍪")
                        .font(.system(size: 40))
                }
            }
            
            .padding()
            Divider()
            
            DisclosureGroup{
                HStack(spacing: 30){
                    Color.purple
                        .frame(width: 70, height: 70)
                        .cornerRadius(60)
                    Color.cyan
                        .frame(width: 70, height: 70)
                        .cornerRadius(60)
                    
                }
                
                .padding(.vertical)
            } label: {
                Text("Colores")
                    .font(.title2)
            }  
            
        }
    }
    
}
    struct FavoritesView_Previews: PreviewProvider {
        static var previews: some View{
            FavoritesView()
        }
    }

