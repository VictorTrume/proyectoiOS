//
//  temporadasF.swift
//  aplicacion_final
//
//  Created by alumno on 5/16/25.
//


import SwiftUI

struct PantallaTemporadas: View{
    @Environment(ControladorAplicacion_SP.self) var controlador
    
    var imagen_a_mostar = temporada_imagenes["1"]
    var body: some View{
        NavigationStack{
            ZStack{
               // Color.black.ignoresSafeArea()
                
                if controlador.lista_temporada != nil {
                    ScrollView{
                        LazyVStack{
                            Text("Temporadas")
                                .font(.system(size: 40))
                                .foregroundColor(.black)
                                .bold()
                            ForEach(controlador.lista_temporada!.items){
                                season in
                                NavigationLink {
                                    TemporadaCapitulos()
                                }label: {
                                    VStack(alignment: .leading, spacing: 12){
                                        Text("Temporada \(season.id)")
                                            .font(.system(size: 30))
                                            .foregroundColor(.white)
                                            .bold()
                                            .frame(maxWidth: .infinity)
                                        
                                        if let imagenNombre = temporada_imagenes["\(season.id)"] {
                                                Image(imagenNombre)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 150, height: 250)
                                                    .frame(maxWidth: .infinity)
                                                    .clipped()
                                                    .cornerRadius(10)
                                                                            }
                                       
                                    }
                                    .padding()
                                    .background(Color.blue.opacity(0.9))
                                    .cornerRadius(80)
                                    .shadow(radius: 10)
                                    .frame(width: 300)
                                }
                                
                                .simultaneousGesture(TapGesture().onEnded({
                                    print("Hola mundo")
                                    controlador.descargar_informacion_temporada(id: season.id)
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
    PantallaTemporadas()
        .environment(ControladorAplicacion_SP())
}
