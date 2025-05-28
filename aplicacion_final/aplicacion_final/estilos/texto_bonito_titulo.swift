//
//  texto_bonito_titulo.swift
//  aplicacion_final
//
//  Created by alumno on 5/26/25.
//

import Foundation
import SwiftUI

struct TituloBonito: View {
    var texto: String
    var body: some View {
        Text(texto)
            .font(.system(size: 32, weight: .heavy, design: .rounded))
            .foregroundColor(.yellow)
            .bold()
            .shadow(color: .white.opacity(0.5), radius: 4, x: 0, y: 2)
            .padding(.top, 30)
            .padding(.bottom, 10)
 
            .zIndex(1)
    }
}
