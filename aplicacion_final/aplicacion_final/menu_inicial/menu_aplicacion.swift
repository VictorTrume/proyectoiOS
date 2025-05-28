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
            
            NavigationStack {
                            PantallaLanding()
                        }
                        .toolbarBackground(.visible, for: .tabBar)
                        .tabItem {
                            Label("Inicio", systemImage: "house.fill")
                        }
                        NavigationStack {
                            PantallaPersonajes()
                        }
                        .toolbarBackground(.visible, for: .tabBar)
                        .tabItem {
                            Label("Personajes", systemImage: "person.fill")
                        }
                        NavigationStack {
                            PantallaTemporadas()
                        }
                        .toolbarBackground(.visible, for: .tabBar)
                        .tabItem {
                            Label("Temporadas", systemImage: "square.stack.fill")
                        }

                        NavigationStack {
                            PantallaTodoscap()
                        }
                        .toolbarBackground(.visible, for: .tabBar)
                        .tabItem {
                            Label("Episodios", systemImage: "tv.fill")
                        }

                    }

        .accentColor(Color.yellow)
             
        }
        
    }


#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion_SP())
}


