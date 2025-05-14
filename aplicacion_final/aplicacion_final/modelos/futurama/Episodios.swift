//
//  Episodios.swift
//  aplicacion_final
//
//  Created by alumno on 5/7/25.
//

struct Episodio: Identifiable, Codable {
    
    let id: Int
       let name: String
       let season: Int
       let episode: Int
       let air_date: String
       let wiki_url: String
       let thumbnail_url: String
       let description: String
       let created_at: String
       let updated_at: String
       let characters: [Int] 
       let locations: [Int]
      }

