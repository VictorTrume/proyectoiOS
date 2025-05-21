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
        TabView{
            
       
       
            PantallaLanding()
                .tabItem{Label("Introduccion",
                                    systemImage: "circle")}
            PantallaPersonajes()
                .tabItem{Label("Personajes",
                                    systemImage: "circle")}
            PantallaTemporadas()
                .tabItem{Label("Temporadas",
                                    systemImage: "circle")}
            
            /*
            PerfilBasicoVista()
            
                .tabItem { Label("Usuario",
                systemImage: "circle") }
             */
            /*
            Tab("Etiqueta", systemImage: "Perfil"){
                Text("Referencia a la pantalla")
            }
             */
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion_SP())
}

