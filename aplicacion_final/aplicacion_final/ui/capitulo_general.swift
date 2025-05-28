import SwiftUI

struct PantallaTodoscap: View {
    @Environment(ControladorAplicacion_SP.self) var controlador
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    TituloBonito(texto: "Capitulos")
                    
                    if let listaEpisodios = controlador.lista_episodio {
                        ScrollView {
                            VStack(spacing: 20) {
                                ForEach(listaEpisodios.items) { episode in
                                    
                                    VStack(spacing: 12) {
                                        
                                        Text(episode.name)
                                            .font(.system(size: 20, weight: .bold, design: .rounded))
                                            .foregroundColor(.white)
                                        
                                        HStack {
                                            Image(systemName: "calendar")
                                                .foregroundColor(.yellow)
                                            Text("Emisión: \(fechaMx(episode.airDate))")
                                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                                .foregroundColor(.white.opacity(0.85))
                                        }
                                        
                                        HStack {
                                            Image(systemName: "film")
                                                .foregroundColor(.yellow)
                                            Text("Código de producción: \(episode.productionCode ?? "No disponible")")
                                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                                .foregroundColor(.white.opacity(0.85))
                                        }
                                        
                                        HStack {
                                            Image(systemName: "film")
                                                .foregroundColor(.yellow)
                                            Text("Código de emision: \(episode.broadcastCode ?? "No disponible")")
                                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                                .foregroundColor(.white.opacity(0.85))
                                        }
                                        
                                        HStack {
                                            Image(systemName: "clock")
                                                .foregroundColor(.yellow)
                                            Text("Duración: \(episode.duration != nil ? "\(episode.duration!) segundos"  : "No disponible")")
                                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                                .foregroundColor(.white.opacity(0.85))
                                        }
                                        
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color.white.opacity(0.1))
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 15)
                                                    .stroke(Color.blue.opacity(0.9), lineWidth: 3)
                                            )
                                    )
                                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 3)
                                    .padding(.horizontal, 16)
                                }
                                
                            }
                            
                            Spacer().frame(height: 30)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaTodoscap()
        .environment(ControladorAplicacion_SP())
}

