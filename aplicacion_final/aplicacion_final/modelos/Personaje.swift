//
//  Personaje.swift
//  aplicacion_final
//
//  Created by alumno on 5/7/25.
//

struct Personaje: Identifiable, Codable {
    let id: Int
    let name: String
    let gender: String
    let species: String
    let status: String
    
    let image: String?
    
 
}
