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
                Image("fbck")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

        
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                if controlador.lista_temporada != nil {
                    ScrollView{
                        LazyVStack{
                            Text("Temporadas")
                                .font(.title)
                                .fontWeight(.heavy)
                                .foregroundColor(.yellow)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                            
                            ForEach(controlador.lista_temporada!.items){
                                season in
                                NavigationLink {
                                    TemporadaCapitulos()
                                }label: {
                                    VStack(alignment: .leading, spacing: 12){
                                       
                                        
                                        if let imagenNombre = temporada_imagenes["\(season.id)"] {
                                                Image(imagenNombre)
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 200, height: 250)
                                                    .frame(maxWidth: .infinity)
                                                    .clipped()
                                                    .cornerRadius(10)
                                                                            }
                                        Text("Temporada \(season.id)")
                                            .font(.system(size: 30))
                                            .foregroundColor(.white)
                                            .bold()
                                            .frame(maxWidth: .infinity)
                                       
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
