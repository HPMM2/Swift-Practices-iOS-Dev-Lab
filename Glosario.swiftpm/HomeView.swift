import SwiftUI

struct HomeView: View {
    // Estados para controlar las animaciones y la navegación
    @State private var isHovered = false        // Detecta si el botón está siendo hovereado
    @State private var letterAnimation = false  // Controla la animación de las letras del título
    @State private var pulseAnimation = false   // Controla la animación de pulso de las líneas
    @State private var navigationPath = NavigationPath()  // Maneja la navegación entre vistas
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack {
                VStack {
                    // SECCIÓN: Título animado "¡Bienvenido!"
                    HStack(spacing: 0) {
                        // Itera sobre cada letra del texto para animarlas individualmente
                        ForEach(Array("¡Bienvenido!".enumerated()), id: \.offset) { index, letter in
                            Text(String(letter))
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            // Animación de rebote vertical para cada letra
                                .offset(y: letterAnimation ? -10 : 10)
                                .animation(
                                    .easeInOut(duration: 0.3)
                                    .repeatForever(autoreverses: true)
                                    .delay(Double(index) * 0.1),  // Retraso progresivo para efecto de ola
                                    value: letterAnimation
                                )
                        }
                    }
                    .padding()
                    .onAppear {
                        letterAnimation = true  // Inicia la animación al aparecer
                    }
                    
                    // SECCIÓN: Imagen circular con efectos visuales
                    ZStack {
                        // Imagen principal del perro "Papuchin"
                        Image("papuchin")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 1000, height: 415)
                            .clipShape(Circle())  // Recorta la imagen en forma circular
                            .overlay(
                                Circle()
                                    .stroke(Color.white, style: StrokeStyle(lineWidth: 10))  // Borde blanco
                            )
                        
                        // Efecto visual: 360 líneas que irradian desde el círculo
                        ForEach(0..<360) { index in
                            Rectangle()
                                .fill(
                                    LinearGradient(
                                        colors: [.white],
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                            // Altura variable que crea efecto de pulso
                                .frame(width: 2, height: pulseAnimation ? CGFloat.random(in: 10...40) : 5)
                                .offset(y: -220)  // Posiciona las líneas en el borde del círculo
                                .rotationEffect(.degrees(Double(index) * 1))  // Distribuye las líneas en 360°
                                .animation(
                                    .easeInOut(duration: Double.random(in: 0.3...0.6))
                                    .repeatForever(autoreverses: true)
                                    .delay(Double.random(in: 0...0.5)),  // Retrasos aleatorios para efecto orgánico
                                    value: pulseAnimation
                                )
                        }
                        
                        // Texto circular alrededor de la imagen
                        ZStack {
                            // Cada letra se posiciona en un ángulo diferente formando un círculo
                            ForEach(Array("En memoria de Papuchin".enumerated()), id: \.offset) { index, letter in
                                Text(String(letter))
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundStyle(.white)
                                    .offset(y: -190)  // Radio del texto circular
                                    .rotationEffect(.degrees(Double(index) * 5 - 50))  // Espaciado angular
                            }
                        }
                    }
                    .frame(width: 500, height: 500)
                    .onAppear {
                        pulseAnimation = true  // Inicia la animación de pulso
                    }
                }
                
                // SECCIÓN: Botón de navegación al glosario
                Button(action: {
                    navigationPath.append("favorites")  // Navega a la vista de favoritos
                }) {
                    HStack {
                        // Ícono de flecha derecha
                        Image(systemName: "arrowshape.forward.fill")
                            .symbolRenderingMode(.multicolor)
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                        // Texto del botón
                        Text("Glosario")
                            .foregroundStyle(.white)
                            .padding()
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        
                        // Ícono de flecha izquierda
                        Image(systemName: "arrowshape.left.fill")
                            .symbolRenderingMode(.multicolor)
                            .foregroundColor(.white)
                            .padding()
                            .font(.largeTitle)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                // Efecto de escala al hacer hover
                .scaleEffect(isHovered ? 1.2 : 1.0)
                .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isHovered)
                .onHover { hovering in
                    isHovered = hovering  // Actualiza el estado de hover
                }
                // Define el destino de navegación
                .navigationDestination(for: String.self) { destination in
                    if destination == "favorites" {
                        FavoritesView()
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            // Imagen de fondo con opacidad
            .background(
                Image("Grey_Icons3")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.5)
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View{
        HomeView()
    }
}
