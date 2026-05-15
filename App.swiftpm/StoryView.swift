import SwiftUI

struct StoryView: View {
    var body: some View {
        ScrollView{
            VStack{
                Group{
                    Text("Yo soy HM")
                        .font(.largeTitle)
                        
                    Text("Yo")
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Divider()
                }
                Text("WAKA WAKA")
                    .padding([.top, .bottom])
                    .foregroundColor(.white)
                Text("Segundo texto")
                    .padding(.bottom)
                    .foregroundColor(.white)
                Group{
                    HStack{
                        Text("Menealo Menealo")
                        Image("pp2")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(15)
                    }
                }
                Group{
                    Text("Descripcion")
                        .font(.title3)
                    Text("Descripcion 2")
                        .italic()
                    Divider()
                }
                
            }
            .padding()
            .frame(maxWidth:.infinity)
            .background(Image("fondo2.1").opacity(0.5))
            .background(in: 
                            RoundedRectangle(cornerRadius: 25))
            .padding()
            
            VStack(alignment: .leading) {
                Group{
                    Text("Otro Apartado")
                        .font(.largeTitle)
                    Text("por HM")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Divider()
                }
            }
            
            .padding()
            .frame(maxWidth: .infinity)
            .background(in:
                            RoundedRectangle(cornerRadius: 16))
                .padding()
            
        }
    }
}


struct StoryView_Preview: PreviewProvider {
    static var previews: some View {
        StoryView()
    }
}
