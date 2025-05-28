//
//  temporadasF.swift
//  aplicacion_final
//
//  Created by alumno on 5/16/25.
//


import SwiftUI

struct PantallaTemporadas: View {
    @Environment(ControladorAplicacion_SP.self) var controlador

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    TituloBonito(texto: "Temporadas")

                    if let listaTemporadas = controlador.lista_temporada {
                        ScrollView {
                            VStack(spacing: 20) {
                                ForEach(listaTemporadas.items) { season in
                                    NavigationLink {
                                        TemporadaCapitulos()
                                    } label: {
                                        VStack(spacing: 12) {
                                            if let imagenNombre = temporada_imagenes["\(season.id)"] {
                                                Image(imagenNombre)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 200, height: 250)
                                                    .clipped()
                                                    .cornerRadius(12)
                                                    .shadow(color: .cyan.opacity(0.5), radius: 6, x: 0, y: 3)
                                            }
                                            
                                            Text("Temporada \(season.id)")
                                                .font(.system(size: 22, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color.white.opacity(0.1))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color.yellow.opacity(0.7), lineWidth: 4)
                                                )
                                        )
                                        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 3)
                                        .padding(.horizontal, 16)
                                    }
                                    .simultaneousGesture(TapGesture().onEnded {
                                        controlador.descargar_informacion_temporada(id: season.id)
                                    })
                                }
                                
                                Spacer().frame(height: 30)
                            }
                            Image("drz")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220)
                        }
                    } else {
                        Text("No hay temporadas disponibles.")
                            .font(.system(size: 20, weight: .medium, design: .rounded))
                            .foregroundColor(.white.opacity(0.8))
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaTemporadas()
        .environment(ControladorAplicacion_SP())
}
