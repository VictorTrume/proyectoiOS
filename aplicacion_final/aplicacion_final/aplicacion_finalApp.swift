//
//  aplicacion_finalApp.swift
//  aplicacion_final
//
//  Created by alumno on 5/7/25.
//

import SwiftUI

@main
@MainActor
struct aplicacion_finalApp: App {
    @State var controlador = ControladorAplicacion_SP()
    
    var body: some Scene {
        WindowGroup {
            MenuNavegacion()
                .environment(controlador)
        }
    }
}
