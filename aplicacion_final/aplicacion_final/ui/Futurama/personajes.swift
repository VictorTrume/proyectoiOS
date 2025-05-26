//
//  personajes.swift
//  aplicacion_final
//
//  Created by alumno on 5/9/25.
//

import SwiftUI

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion_SP.self) var controlador

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    
                    Text("Personajes")
                        .font(.system(size: 32, weight: .heavy, design: .rounded))
                        .foregroundColor(.yellow)
                        .bold()
                        .shadow(color: .white.opacity(0.5), radius: 4, x: 0, y: 2)
                        .padding(.top, 30)
                        .padding(.bottom, 10)
             
                        .zIndex(1)

                    if let lista = controlador.lista_personaje {
                        ScrollView {
                            LazyVStack(spacing: 20) {
                                ForEach(lista.items) { persona in
                                    NavigationLink {
                                        DetallesPersonaje()
                                    } label: {
                                        VStack(spacing: 12) {
                                            Text(persona.name)
                                                .font(.system(size: 20, weight: .bold, design: .rounded))
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity, alignment: .center)

                                            if let imageUrlString = persona.image, let url = URL(string: imageUrlString) {
                                                HStack {
                                                    Spacer()
                                                    
                                                    AsyncImage(url: url) { phase in
                                                        if let image = phase.image {
                                                            image
                                                                .resizable()
                                                                .scaledToFill()
                                                                .frame(width: 200, height: 200)
                                                                .clipShape(Circle())
                                                                .overlay(Circle().stroke(Color.cyan, lineWidth: 4))
                                                                .shadow(radius: 10)
                                                        } else if phase.error != nil {
                                                            Text("No hay imagen")
                                                                .frame(width: 200, height: 200)
                                                                .background(Color.gray.opacity(0.3))
                                                                .clipShape(Circle())
                                                        } else {
                                                            ProgressView()
                                                                .frame(width: 200, height: 200)
                                                        }
                                                    }
                                                    
                                                    Spacer()
                                                }
                                            } else {
                                                HStack {
                                                    Spacer()
                                                    Text("Imagen no disponible")
                                                        .frame(width: 150, height: 250)
                                                        .background(Color.gray.opacity(0.2))
                                                        .cornerRadius(10)
                                                    Spacer()
                                                }
                                            }
                                        }
                                        .padding()
                                        .background(
                                            RoundedRectangle(cornerRadius: 15)
                                                .fill(Color.white.opacity(0.1))
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 15)
                                                        .stroke(Color.yellow.opacity(0.6), lineWidth: 4)
                                                )
                                        )
                                        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 3)
                                        .padding(.horizontal, 16)
                                        .animation(.easeIn(duration: 0.3), value: lista.items.count)
                                    }
                                    .simultaneousGesture(TapGesture().onEnded {
                                        controlador.descargar_informacion_personaje(id: persona.id)
                                    })
                                }

                                Spacer().frame(height: 30)
                            }
                            Image("spng")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220)
                     
                                

                        }
                    } else {
                        Text("No hay datos disponibles.")
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
    PantallaPersonajes()
        .environment(ControladorAplicacion_SP())
}


