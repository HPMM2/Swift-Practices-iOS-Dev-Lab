import SwiftUI

struct EjemploView: View {
    var body: some View {
        VStack {
            VStack {
                Text ("🐰 🐰")
                    .font(.system(size: (100)))
                Text ("Papuchin   Pachonchis")
                    .font(.title)
                    
            }
            .padding(80)
            .background(Color.mint, in:
                            RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(Color.white)
        }
    }
    
    
}


#Preview {
    EjemploView()
}
