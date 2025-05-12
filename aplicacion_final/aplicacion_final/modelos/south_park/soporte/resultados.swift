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
    let data: [Personaje]
    let meta: Meta?
    let links: Enlaces?
}

struct PaginaResultado_Episodio: Codable{
    let data: [Episodio]
    let meta: Meta?
    let link: Enlaces?
}

struct PaginaResultado_Familia: Codable{
    let data: [Familia]
    let meta: Meta?
    let link: Enlaces?
}

struct PaginaResultado_Ubicacion: Codable{
    let data: [Ubicacion]
    let meta: Meta?
    let link: Enlaces?
}
