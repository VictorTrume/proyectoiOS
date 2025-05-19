//
//  personajes.swift
//  aplicacion_final
//
//  Created by alumno on 5/9/25.
//

import SwiftUI

struct PantallaPersonajes: View{
    @Environment(ControladorAplicacion_SP.self) var controlador
    
    //var imagen_a_mostar = temporada["1"]
    var body: some View{
        NavigationStack{
            ZStack{
               // Color.black.ignoresSafeArea()
                
                if controlador.lista_personaje != nil {
                    ScrollView{
                        LazyVStack{
                            Text("Personajes de Futurama")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                                .bold()
                            ForEach(controlador.lista_personaje!.items){
                                persona in
                                NavigationLink {
                                   
                                }label: {
                                    VStack(alignment: .leading, spacing: 12){
                                        Text("\(persona.name)")
                                            .font(.system(size: 30))
                                            .foregroundColor(.white)
                                            .bold()
                                            .frame(maxWidth: .infinity)
                                        
                                        
                                        if let imageUrlString = persona.image, let url = URL(string: imageUrlString) {
                                            AsyncImage(url: url) { phase in
                                                if let image = phase.image {
                                                    image
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 150, height: 250)
                                                        .frame(maxWidth: .infinity)
                                                        .clipped()
                                                        .cornerRadius(10)
                                                } else if phase.error != nil {
                                                    Text("No hay imagen")
                                                        .frame(width: 150, height: 250)
                                                        .background(Color.gray.opacity(0.2))
                                                        .cornerRadius(10)
                                                } else {
                                                    ProgressView()
                                                        .frame(width: 150, height: 250)
                                                }
                                            }
                                        } else {
                                            Text("URL inválida")
                                                .frame(width: 150, height: 250)
                                                .background(Color.gray.opacity(0.2))
                                                .cornerRadius(10)
                                        }

                                         
                                        Text("Genero:  \(persona.gender)")
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(.white)
                                            .bold()
                                        
                                        Text("Raza:  \(persona.species)")
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                    .padding()
                                    .background(Color.blue.opacity(0.9))
                                    .cornerRadius(80)
                                    .shadow(radius: 10)
                                    .frame(width: 300)
                                }
                                
                                        
                            }
                        }
                    }
                }
                else {
                    Text("Esto esta vacio")
                }
            }
        }
    }
}
#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion_SP())
}
