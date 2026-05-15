import SwiftUI

struct ContentView: View {
    var body: some View {
        //Zstack es profundidad (capas)
        //VStack es vertical
        //HStack es horizontal
        ZStack {
            RoundedRectangle(cornerRadius: 70) // Rectangulo
                .frame(width: 300, height: 400) // Altura y ancho
                .foregroundStyle(Color.pink)
                .offset(y:350) // Posicion en vertical
            
            RoundedRectangle(cornerRadius: 80) //Cuello
                .frame(width: 100, height: 150)
                .foregroundStyle(Color.brown)
                .offset(y:130)
            
            Circle() //Cabello B
                .trim(from: 0.5, to: 1.0) // Corte
                .foregroundStyle(Color.mint)
            
            Circle() //Cabeza
                .frame(width: 250, height: 400)
                .foregroundStyle(Color.brown)
            
            Circle() //Cabello A
                .trim(from: 0.7, to: 1.0)
                .foregroundStyle(Color.purple)
            
            Circle() //Ojo A
                .frame(width: 50)
                .offset(x: 35, y: -60)
                .foregroundStyle(Color.white)
            
            
            Circle() // Nariz
                .frame(width: 50)
                .foregroundStyle(Color.pink)
            
            Circle() //Ojo B
                .frame(width: 50)
                .offset(x: -35, y: -60)
                .foregroundStyle(Color.white)
            
            Circle() // Retina
                .frame(width: 25)
                .offset(x: 35, y: -60)
                .foregroundStyle(Color.blue)
          
            Circle() // Retina
                .frame(width: 25)
                .offset(x: -35, y: -60)
                .foregroundStyle(Color.blue)    
            
            Circle() // Boca
                .trim(from: -1, to: 0.5)
                .offset(y:30)
                .frame(width: 500, height: 150)
                .foregroundStyle(Color.white)
 
            
        }
    }
}
