import SwiftUI

struct FavoritesView: View {
    @State private var searchText = ""
    @State private var selectedTerm: String? = nil
    
    // Tu glosario con definiciones
    let glossaryItems: [String: String] = [
        "Comentarios": "Son notas dejadas por el programador.",
        "Error": "Problemas con la sintaxis del código.",
        "Playground": "Entorno interactivo de Xcode donde puedes escribir y probar código Swift rápidamente sin crear un proyecto completo. Muestra los resultados en tiempo real.",
        "Barra lateral de resultados": "Panel que muestra una preview.",
        "Asignación": "Acción de darle un valor a una variable o constante usando el operador =. Por ejemplo: edad = 25",
        "Constante": "Valor que no puede cambiar una vez asignado.",
        "Variable": "Espacio en memoria que puede almacenar y cambiar valores. En Swift se declara con 'var'. Su valor puede modificarse durante la ejecución del programa.",
        "Declaración": "Acción de crear una variable, constante, función o cualquier otro elemento de código. Le das un nombre y opcionalmente un tipo y valor inicial.",
        "Identificador": "Nombre que le das a variables, constantes, funciones, clases, etc. Debe comenzar con letra o guión bajo, y ser descriptivo de su propósito.",
        "Carácter": "Una sola letra, número, símbolo o espacio. En Swift es de tipo Character. Por ejemplo: 'A', '5', '@'",
        "Carácter de escape": "Barra invertida (\\) que indica que el siguiente carácter tiene un significado especial en una cadena de texto.",
        "Secuencia de escape": "Combinación de caracteres que comienza con \\ y representa caracteres especiales. Ejemplos: \\n (nueva línea), \\t (tabulación), \\\" (comillas).",
        "Cadena": "Secuencia de caracteres, es decir, texto. En Swift es de tipo String y se escribe entre comillas dobles. Ejemplo: \"Hola mundo\"",
        "Interpolación de cadenas": "Técnica para insertar valores de variables o expresiones dentro de una cadena usando \\(). Ejemplo: \"Tengo \\(edad) años\"",
        "Unicode": "Estándar internacional que asigna un número único a cada carácter de todos los sistemas de escritura del mundo, incluyendo emojis.",
        "Consola": "Área de Xcode donde se muestran mensajes, resultados de print() y errores durante la ejecución del programa. También llamada área de depuración.",
        "Depuración": "Proceso de encontrar y corregir errores (bugs) en tu código. Incluye usar breakpoints, revisar valores de variables y seguir el flujo del programa.",
        "Registro": "Acción de escribir información sobre la ejecución del programa para revisar después. Ayuda a entender qué está pasando en tu código.",
        "Print": "Función que muestra información en la consola. Útil para ver valores de variables y entender el flujo del programa. Ejemplo: print(\"Hola\")",
        "Simulador": "Aplicación que emula un dispositivo iOS en tu Mac, permitiéndote probar tu app sin necesidad de un iPhone o iPad físico.",
        "Inspector de atributos": "Panel en Xcode donde puedes modificar propiedades visuales y de comportamiento de elementos de interfaz sin escribir código.",
        "StoryBoard": "Archivo visual en Xcode donde diseñas la interfaz de tu app arrastrando y conectando pantallas y elementos. Muestra el flujo entre vistas.",
        "Abstracción": "Concepto de simplificar algo complejo ocultando detalles innecesarios y mostrando solo lo esencial. Como usar un control remoto sin saber cómo funciona por dentro.",
        "Función": "Bloque de código reutilizable que realiza una tarea específica. Puede recibir valores (parámetros) y devolver un resultado. Se declara con 'func'.",
        "Algoritmo": "Serie de pasos ordenados para resolver un problema o completar una tarea. Es como una receta de cocina pero para la computadora.",
        "API": "Application Programming Interface. Conjunto de funciones y reglas que permiten que diferentes programas se comuniquen entre sí. Como un menú de restaurante que muestra qué puedes pedir.",
        "Inmutable": "Que no puede cambiar. Se refiere a valores constantes (declarados con 'let') que mantienen su valor original durante toda la ejecución.",
        "Mutable": "Que puede cambiar. Se refiere a variables (declaradas con 'var') cuyos valores pueden modificarse después de ser creadas."
    ]
    
    var sortedKeys: [String] {
        glossaryItems.keys.sorted()
    }
    
    var filteredItems: [String] {
        if searchText.isEmpty {
            return sortedKeys
        } else {
            return sortedKeys.filter { item in
                item.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Header con título
            VStack(spacing: 10) {
                Text("📚 Glosario Swift")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 2)
                
                Text("\(filteredItems.count) términos")
                    .font(.subheadline)
                    .foregroundStyle(.white.opacity(0.8))
            }
            .padding(.top, 20)
            .padding(.bottom, 15)
            
            // Barra de búsqueda mejorada
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white.opacity(0.7))
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                
                TextField("", text: $searchText, prompt: Text("Buscar término...").foregroundColor(.white))
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(.white)
                    .font(.system(size: 17))
                
                
                if !searchText.isEmpty {
                    Button(action: {
                        withAnimation {
                            searchText = ""
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white.opacity(0.7))
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white.opacity(0.15))
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
            )
            .padding(.horizontal, 20)
            .padding(.bottom, 15)
            
            // Lista de resultados
            if filteredItems.isEmpty {
                Spacer()
                VStack(spacing: 15) {
                    Image(systemName: "questionmark.circle")
                        .font(.system(size: 60))
                        .foregroundStyle(.white.opacity(0.5))
                    
                    Text("No se encontraron resultados")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .fontWeight(.medium)
                    
                    Text("Intenta con otra búsqueda")
                        .foregroundStyle(.white.opacity(0.7))
                        .font(.subheadline)
                }
                Spacer()
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(filteredItems, id: \.self) { term in
                            Button(action: {
                                selectedTerm = term
                            }) {
                                HStack(spacing: 15) {
                                    // Icono decorativo
                                    ZStack {
                                        Circle()
                                            .fill(
                                                LinearGradient(
                                                    colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)],
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                )
                                            )
                                            .frame(width: 45, height: 45)
                                        
                                        Text(String(term.prefix(1)))
                                            .font(.system(size: 20, weight: .bold))
                                            .foregroundStyle(.white)
                                    }
                                    
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(term)
                                            .foregroundStyle(.white)
                                            .font(.system(size: 19, weight: .semibold))
                                        
                                        Text("Toca para ver definición")
                                            .foregroundStyle(.white.opacity(0.6))
                                            .font(.system(size: 13))
                                            .fontWeight(.bold)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundStyle(.white.opacity(0.5))
                                        .font(.system(size: 16, weight: .semibold))
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.white.opacity(0.1))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                        )
                                )
                                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .padding(.horizontal, 20)
                        }
                    }
                    .padding(.vertical, 10)
                }
                .sheet(item: Binding(
                    get: { selectedTerm.map { TermWrapper(term: $0) } },
                    set: { selectedTerm = $0?.term }
                )) { wrapper in
                    TermDetailView(term: wrapper.term, definition: glossaryItems[wrapper.term] ?? "")
                }
            }
        }
    
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("Grey_Icons311")
                .resizable()
                .scaledToFill()
                .opacity(0.9)
        )
}
}

// Wrapper para hacer String compatible con Identifiable
struct TermWrapper: Identifiable {
    let id = UUID()
    let term: String
}

// Vista de detalle mejorada
struct TermDetailView: View {
    let term: String
    let definition: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // Fondo
            Image("Grey_Icons311")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.7)
            
            VStack(spacing: 0) {
                // Header personalizado
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack(spacing: 8) {
                            Image(systemName: "arrow.left.circle.fill")
                                .font(.system(size: 24))
                            Text("Glosario")
                                .font(.system(size: 17, weight: .semibold))
                        }
                        .foregroundStyle(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Spacer()
                }
                .padding()
                .background(Color.black.opacity(0.2))
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 25) {
                        // Icono grande con la letra inicial
                        HStack {
                            Spacer()
                            ZStack {
                                Circle()
                                    .fill(
                                        LinearGradient(
                                            colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .frame(width: 100, height: 100)
                                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                                
                                Text(String(term.prefix(1)))
                                    .font(.system(size: 50, weight: .bold))
                                    .foregroundStyle(.white)
                            }
                            Spacer()
                        }
                        .padding(.top, 20)
                        
                        // Título del término
                        VStack(alignment: .leading, spacing: 10) {
                            Text(term)
                                .font(.system(size: 34, weight: .bold))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.leading)
                            
                            Rectangle()
                                .fill(
                                    LinearGradient(
                                        colors: [Color.blue.opacity(0.7), Color.purple.opacity(0.7)],
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(height: 4)
                                .frame(maxWidth: 100)
                                .cornerRadius(2)
                        }
                        
                        // Definición
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Definición")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.black.opacity(0.7))
                                .textCase(.uppercase)
                                .tracking(1.2)
                            
                            Text(definition)
                                .font(.system(size: 19, weight: .regular))
                                .foregroundStyle(.black)
                                .lineSpacing(6)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.5))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                                )
                        )
                    }
                    .padding(.horizontal, 25)
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FavoritesView()
        }
    }
}
