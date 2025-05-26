//
//  menu_aplicacion.swift
//  aplicacion_final
//
//  Created by alumno on 5/19/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion_SP.self) var controlador
    
    var body: some View {
        

        TabView {
            
            PantallaLanding()
                .tabItem {
                    Label("Inicio", systemImage: "house")
                }
            
            PantallaPersonajes()
                .tabItem {
                    Label("Personajes", systemImage: "star")
                }
            
            PantallaTemporadas()
                .tabItem {
                    Label("Temporadas", systemImage: "film")
                }
            
            /*
            PerfilBasicoVista()
                .tabItem {
                    Label("Usuario", systemImage: "person.crop.circle")
                }
            */
        }
        .tint(.yellow)
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion_SP())
}


