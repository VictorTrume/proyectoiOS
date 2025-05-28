//
//  resultados.swift
//  aplicacion_final
//
//  Created by alumno on 5/9/25.
//



struct PaginaResultado_Personaje: Codable {
    let items: [Personaje]
    let total: Int
    let page: Int
    let size: Int
    let pages: Int
    
}

struct PaginaResultado_Episodio: Codable{
    let items: [Episodio]
    let total: Int
    let page: Int
    let size: Int
    let pages: Int
}


struct PaginaResultado_Temporada: Codable{
    let items: [Temporada]
    let total: Int
    let page: Int
    let size: Int
    let pages: Int
}




