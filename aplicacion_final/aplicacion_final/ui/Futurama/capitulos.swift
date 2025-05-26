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
                        
                        Text("Capítulos de la temporada")
                            .font(.system(size: 25, weight: .heavy, design: .rounded))
                            .foregroundColor(.yellow)
                            .shadow(color: .yellow.opacity(0.7), radius: 5, x: 0, y: 2)
                            .padding(.top, 40)
                        
                        ForEach(temporada.episodes) { episodio in
                            VStack(alignment: .leading, spacing: 8) {
                                
                                Text(episodio.name)
                                    .font(.system(size: 20, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                                
                                
                                
                                HStack {
                                    Image(systemName: "film")
                                        .foregroundColor(.cyan)
                                    Text("Código de produccion: \(episodio.productionCode ?? "No disponible")")
                                        .font(.system(size: 16, weight: .medium, design: .rounded))
                                        .foregroundColor(.white.opacity(0.85))
                                }
                                
                                
                                
                                
                                
                            }
                            
                          
                        }     .padding()
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
                    
                
                }

                }
            }
        }
    }


#Preview {
    TemporadaCapitulos()
        .environment(ControladorAplicacion_SP())
}
