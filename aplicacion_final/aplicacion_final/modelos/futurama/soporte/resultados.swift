//
//  resultados.swift
//  aplicacion_final
//
//  Created by alumno on 5/9/25.
//


struct Meta: Codable{

    let totalItems: Int
    let itemCount: Int
    let itemsPerPage: Int
    let totalPages: Int
    let currentPage: Int

}
 
struct Enlaces: Codable{

    let first: String?
    let previous: String?
    let next: String?
    let last: String?

}

struct PaginaResultado_Personaje: Codable {
    let items: [Personaje]
    let total: Int
    let page: Int
    let size: Int
    let pages: Int
    
}

struct PaginaResultado_Episodio: Codable{
    let items: [Episodio]
    let meta: Meta
    let link: Enlaces
}


