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
                Image("fbck")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

        
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                if controlador.lista_personaje != nil {
                    ScrollView{
                        LazyVStack{
                            Text("Personajes de Futurama")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.yellow)
                                .multilineTextAlignment(.center)
                                .padding(.top, 20)
                                
                            ForEach(controlador.lista_personaje!.items){
                                persona in
                                NavigationLink {
                                   DetallesPersonaje()
                                }label: {
                                    VStack(alignment: .leading, spacing: 12){
                                        Text("\(persona.name)")
                                            .font(.system(size: 20))
                                            .foregroundColor(.white)
                                            .bold()
                                            .frame(maxWidth: .infinity)
                                        
                                        
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
                                                Text("URL inválida")
                                                    .frame(width: 150, height: 250)
                                                    .background(Color.gray.opacity(0.2))
                                                    .cornerRadius(10)
                                                Spacer()
                                            }
                                        }

                                         
                                       
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 200)
                                        .fill(Color.blue.opacity(0.2))
                                        .overlay(
                                        RoundedRectangle(cornerRadius: 200)
                                        .stroke(Color.cyan, lineWidth: 2))
                                                                                   
                                    )
                                    
                                }
                                .simultaneousGesture(TapGesture().onEnded({
                                    print("Hola mundo")
                                    controlador.descargar_informacion_personaje(id: persona.id)
                                }))
                                
                                        
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
