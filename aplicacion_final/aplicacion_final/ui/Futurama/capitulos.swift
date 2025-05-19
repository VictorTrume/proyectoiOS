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
            
            
            if controlador.temporada != nil{
                
                ScrollView {
                    VStack {
                        Text("Capitulos:")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        ForEach(controlador.temporada!.episodes ) { episodio in
                            VStack(spacing: 10) {
                                Text(episodio.name )
                          
                                    .font(.body)
                                    .bold()
                                
                 
                                
                                
                                Text("Fecha de emision:  \(episodio.airDate ?? "No disponible")")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                
                                
                                Text("Codigo de produccion:  \(episodio.productionCode ?? "No disponible")")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                
                                Text("Duración: \(episodio.duration != nil ? "\(episodio.duration!) min" : "No disponible")")

                               
                                
                                
                                
                                    .onDisappear {
                                        print("Adios papus")
                                    }
                                    .padding()
                                    .background(Color.blue.opacity(0.9))
                                    .cornerRadius(80)
                                    .shadow(radius: 10)
                                    .frame(width: 300)
                            }
                            .padding(.bottom)
                        }
                    }
                    .padding()
                }
            }
            else{
                Text("No se puede ver ")
            }
            
        }
        
    }
}

#Preview {
    TemporadaCapitulos()
        .environment(ControladorAplicacion_SP())
}
