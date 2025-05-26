//
//  capitulos.swift
//  aplicacion_final
//
//  Created by alumno on 5/14/25.
//

//
//  perfil_transformaciones.swift
//  RedesSociales
//
//  Created by alumno on 4/11/25.
//
import SwiftUI

struct TemporadaCapitulos: View {
    @Environment(ControladorAplicacion_SP.self) var controlador

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.black.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            if let temporada = controlador.temporada {
                ScrollView {
                    VStack(spacing: 20) {
                        // Título
                        Text("Capítulos")
                            .font(.system(size: 30, weight: .heavy, design: .rounded))
                            .foregroundColor(.yellow)
                            .shadow(color: .yellow.opacity(0.7), radius: 5, x: 0, y: 2)
                            .padding(.top, 40)

                        // Lista de episodios
                        ForEach(temporada.episodes) { episodio in
                            VStack(alignment: .leading, spacing: 8) {
                                // Nombre del episodio
                                Text(episodio.name)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)

                                // Fecha (sin formatear)
                                HStack {
                                    Image(systemName: "calendar")
                                        .foregroundColor(.yellow)
                                    Text("Emitido: \(episodio.airDate ?? "No disponible")")
                                        .font(.system(size: 16, weight: .medium, design: .rounded))
                                        .foregroundColor(.white.opacity(0.85))
                                }

                                // Código de producción
                                HStack {
                                    Image(systemName: "film")
                                        .foregroundColor(.cyan)
                                    Text("Código: \(episodio.productionCode ?? "No disponible")")
                                        .font(.system(size: 16, weight: .medium, design: .rounded))
                                        .foregroundColor(.white.opacity(0.85))
                                }

                                // Duración
                                if let duracion = episodio.duration {
                                    HStack {
                                        Image(systemName: "clock")
                                            .foregroundColor(.green)
                                        Text("Duración: \(duracion) min")
                                            .font(.system(size: 16, weight: .medium, design: .rounded))
                                            .foregroundColor(.white.opacity(0.85))
                                    }
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white.opacity(0.1))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15)
                                            .stroke(Color.cyan.opacity(0.6), lineWidth: 3)
                                    )
                            )
                            .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 3)
                            .padding(.horizontal, 16)
                        }

                        Spacer().frame(height: 30)
                    }
                }
            } else {
                
                Text("No se puede ver.")
                    .font(.system(size: 20, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.8))
                    .padding()
            }
        }
    }
}

#Preview {
    TemporadaCapitulos()
        .environment(ControladorAplicacion_SP())
}
