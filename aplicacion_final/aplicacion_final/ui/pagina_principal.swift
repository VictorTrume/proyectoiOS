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
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.9), Color.cyan.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()

                
                
                ScrollView {
                    VStack(spacing: 25) {
                        
                        Image("Flogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.yellow, lineWidth: 4))
                            .shadow(color: .white.opacity(0.6), radius: 10, x: 0, y: 5)
                            .padding(.top, 50)

                        
                        Text("¡Bienvenidos al mundo del mañana!")
                            .font(.system(size: 26, weight: .heavy, design: .rounded))
                            .foregroundColor(.yellow)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 20)
                            .shadow(color: .yellow.opacity(0.3), radius: 10, x: 0, y: 5)
                 
                        VStack(alignment: .leading, spacing: 12) {
                            Text("""
                            Esta es una aplicación conectada a “https://futuramaapi.com/” que permite obtener información relacionada a la serie animada de FOX “Futurama”.

                            Puedes consultar una lista de personajes y temporadas. Cada temporada contiene una lista de capítulos que le corresponden.

                            NOTA: Las temporadas y capítulos se muestran en su orden de emisión.
                            """)
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(16)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(15)
                        .bold()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                            
                                .stroke(Color.yellow.opacity(0.9), lineWidth: 2)
                        )
                        .padding(.horizontal, 20)

                        
                        VStack(alignment: .leading, spacing: 12) {
                            Text("""
                            ¿Qué es el código de producción?

                            Es un código que nos dice el orden correcto de los capítulos.
                            """)
                                .font(.system(size: 16, weight: .medium, design: .rounded))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(16)
                        .background(Color.black.opacity(0.8))
                        .cornerRadius(15)
                        .bold()
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                            
                                .stroke(Color.yellow.opacity(0.9), lineWidth: 2)
                        )
                        .padding(.horizontal, 20)
                  
                        Image("fpng")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.yellow, lineWidth: 3))
                            .shadow(color: .cyan.opacity(0.6), radius: 8, x: 0, y: 4)

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
