//
//  detallespersonaje.swift
//  aplicacion_final
//
//  Created by alumno on 5/21/25.
//

import SwiftUI

struct DetallesPersonaje: View {
    
    @Environment(ControladorAplicacion_SP.self) var controlador
    @State private var mostrarAlerta = true
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.black.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                  
                    Text(controlador.personaje?.name ?? "Desconocido")
                        .font(.system(size: 32, weight: .heavy, design: .rounded))
                        .foregroundColor(.yellow)
                        .shadow(color: .yellow.opacity(0.7), radius: 4, x: 0, y: 2)
                        .padding(.top, 30)
                    
             
            
                    if let imageUrlString = controlador.personaje?.image, let url = URL(string: imageUrlString) {
                        AsyncImage(url: url) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 400)
                         
                                   
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
                        
                        
                        
                    } else {
                        Text("URL inválida")
                            .frame(width: 150, height: 250)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(10)
                    }
                    
              
                    VStack(spacing: 15) {
                        DetalleTexto(titulo: "Género", valor: controlador.personaje?.gender)
                        DetalleTexto(titulo: "Especie", valor: controlador.personaje?.species)
                        DetalleTexto(titulo: "Estatus", valor: controlador.personaje?.status)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.black.opacity(0.4))
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.cyan, lineWidth: 2))
                            .shadow(radius: 5)
                    )
                    .padding(.horizontal, 30)
                    
                    Spacer()
                }
            
                .onAppear {
                            
                mostrarAlerta = true
                }
                    }
                }
                .alert("¡ALERTA SPOILER!", isPresented: $mostrarAlerta) {
                Button("Ok", role: .cancel) { }
                        } message: {
                            Text("¡Atención! Esta vista puede contener spoilers.")
                        }


            }
        }
    


struct DetalleTexto: View {
    var titulo: String
    var valor: String?
    
    var body: some View {
        HStack {
            Text("\(titulo):")
                .foregroundColor(.yellow)
                .fontWeight(.bold)
            Spacer()
            Text(valor ?? "Desconocido")
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
        .padding(.horizontal)
    }
}

#Preview {
    NavigationStack {
        DetallesPersonaje()
            .environment(ControladorAplicacion_SP())
    }
}




