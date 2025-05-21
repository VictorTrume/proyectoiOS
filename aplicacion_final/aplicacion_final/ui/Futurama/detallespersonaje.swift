//
//  detallespersonaje.swift
//  aplicacion_final
//
//  Created by alumno on 5/21/25.
//

import SwiftUI

struct DetallesPersonaje: View {
    
    @Environment(ControladorAplicacion_SP.self) var controlador
    
    var body: some View {
        ZStack {
            Image("fbck")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            Color.black.opacity(0.5)
                .ignoresSafeArea()
       
            ScrollView{
                VStack {
                    Text("\(controlador.personaje?.name ?? "Valor por defecto")")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    
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
                    Text("Genero : \(controlador.personaje?.gender ?? "Valor por defecto")")
                        .fontWeight(.heavy)
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Spacer()
                    Spacer()
                    Text("Especie : \(controlador.personaje?.species ?? "Valor por defecto")")
                        .fontWeight(.heavy)
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    Spacer()
                    Spacer()
                    Text("Estatus : \(controlador.personaje?.status ?? "Valor por defecto")")
                        .fontWeight(.heavy)
                        .foregroundColor(.yellow)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                       
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                .padding(60)
                
                
                
            }
        }
    }


#Preview {
    NavigationStack {
        DetallesPersonaje()
            .environment(ControladorAplicacion_SP())
    }
}


