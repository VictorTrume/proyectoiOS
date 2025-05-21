//
//  Landing page.swift
//  aplicacion_final
//
//  Created by alumno on 5/21/25.
//
import SwiftUI

struct PantallaLanding: View {
    @Environment(ControladorAplicacion_SP.self) var controlador

    var body: some View {
        NavigationStack {
            ZStack {
               
                Image("fbck")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

        
                Color.black.opacity(0.5)
                    .ignoresSafeArea()

                ScrollView {
                    LazyVStack(spacing: 20) {
                        Spacer().frame(height: 40)

                       
                        Image("Flogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 180, height: 180)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                            .shadow(radius: 10)

                    
                        Text("¡Bienvenidos al mundo del mañana!")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.yellow)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)

                     
                        VStack(alignment: .leading, spacing: 12) {
                            Text("""
                            Esta es una aplicación conectada a “https://futuramaapi.com/” que permite obtener información relacionada a la serie animada de FOX “Futurama”.
                            
                            Puedes consultar una lista de personajes y temporadas. Cada temporada contiene una lista de capítulos que le corresponden.
                            
                            NOTA: Las temporadas y capítulos se muestran en su orden de emisión.
                            """)
                                .font(.body)
                                .foregroundColor(.white)
                                .bold()
                        }
                        .padding()
                        .background(Color.black.opacity(0.4))
                        .cornerRadius(15)
                        .padding(.horizontal)

                   
                        Image("fpng")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.cyan, lineWidth: 3))
                            .shadow(radius: 8)

                        Spacer().frame(height: 40)
                    }
                }
            }
        }
    }
}

#Preview {
    PantallaLanding()
        .environment(ControladorAplicacion_SP())
}
