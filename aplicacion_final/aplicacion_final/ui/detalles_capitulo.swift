//
//  detalles_capitulo.swift
//  aplicacion_final
//
//  Created by alumno on 5/28/25.
//

import SwiftUI

struct DetallesCapitulo: View {
    
    @Environment(ControladorAplicacion_SP.self) var controlador
    @State private var mostrarAlerta = true
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.black.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    Text(controlador.episodio?.name ?? "Nombre capitulo")
                        .font(.system(size: 28, weight: .heavy, design: .rounded))
                        .foregroundColor(.yellow)
                        .shadow(color: .white.opacity(0.4), radius: 4, x: 0, y: 2)
                        .padding(.top, 30)
                    
                    Spacer()
                    Spacer()
                    
                    VStack(spacing: 15) {
                        HStack{
                            Spacer()
                            Image(systemName: "calendar")
                                .foregroundColor(.yellow)
                            DetalleTexto(titulo: "Emision", valor: fechaMx(controlador.episodio?.airDate) )
                        }
                        HStack{
                            Spacer()
                            Image(systemName: "film")
                                .foregroundColor(.yellow)
                        DetalleTexto(titulo: "Código de producción", valor: controlador.episodio?.productionCode)
                            }
                        
                        HStack{
                            Spacer()
                            Image(systemName: "film")
                                .foregroundColor(.yellow)
                            DetalleTexto(titulo: "Código de producción", valor: controlador.episodio?.broadcastCode)
                        }
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.black.opacity(0.4))
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.cyan, lineWidth: 2))
                            .shadow(radius: 5)
                    )
                    .padding(.horizontal, 30)
                    
                    Spacer()
                    
                }
                Image("nib")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220)
                
            }
        }
    }
}
    




#Preview {
    NavigationStack {
        DetallesCapitulo()
            .environment(ControladorAplicacion_SP())
    }
}





