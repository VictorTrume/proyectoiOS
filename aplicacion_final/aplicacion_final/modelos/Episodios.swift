//
//  Episodios.swift
//  aplicacion_final
//
//  Created by alumno on 5/7/25.
//

struct Episodio: Identifiable, Codable {
    
    let id: Int
    let name: String
    let productionCode: String
    let airDate: String?
    let duration: Int?
    let createdAt: String?  
    let broadcastCode: String?
    
    
  }

