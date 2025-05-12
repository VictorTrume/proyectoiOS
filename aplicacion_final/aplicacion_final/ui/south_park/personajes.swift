//
//  personajes.swift
//  aplicacion_final
//
//  Created by alumno on 5/9/25.
//

import SwiftUI

struct PantallaPersonajes: View{
    @Environment(ControladorAplicacion_SP.self) var controlador
    
    var body: some View{
        NavigationStack{
            ZStack{
               // Color.black.ignoresSafeArea()
                
                if controlador.lista_personaje != nil {
                    ScrollView{
                        LazyVStack{
                            Text("Personajes de South Park")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                                .bold()
                            ForEach(controlador.lista_personaje!.data){
                                perso in
                                NavigationLink{
                                    
                                }
                            label: {
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("\(perso.name)")
                                    font(.system(size: 30))
                                        .bold()
                                    
                                        .frame(maxWidth: .infinity)
                                    
                                    AsyncImage(url: URL(string: perso.url)) {
                                        image in image
                                            .image?.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 150, height: 250)
                                            .frame(maxWidth: .infinity)
                                            .clipped()
                                            .cornerRadius(10)
                                    }
                                    
                                    
                                    Text("Genero: \(perso.sex)")
                                    font(.system(size: 30))
                                        .bold()
                                    
                                        .frame(maxWidth: .infinity)
                                    Text("Religion: \(perso.religion)")
                                    font(.system(size: 30))
                                        .bold()
                                    
                                        .frame(maxWidth: .infinity)
                                }
                                .padding()
                                .background(Color.blue.opacity(0.9))
                                .cornerRadius(80)
                                .shadow(radius: 10)
                                .frame(width: 300)
                            }
                            .simultaneousGesture(TapGesture().onEnded({
                                print("Hola mundo")
                                controlador.descargar_informacion_personaje(id: perso.id)
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
