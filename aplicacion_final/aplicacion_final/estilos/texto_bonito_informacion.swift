//
//  texto_bonito_informacion.swift
//  aplicacion_final
//
//  Created by alumno on 5/28/25.
//

import Foundation
import SwiftUI


struct DetalleTexto: View {
    var titulo: String
    var valor: String?
    
    var body: some View {
        HStack {
            Text("\(titulo):")
                .foregroundColor(.yellow)
                .fontWeight(.bold)
            Spacer()
            Text(valor ?? "Desconocido")
                .foregroundColor(.white)
                .fontWeight(.semibold)
        }
        .padding(.horizontal)
    }
}
