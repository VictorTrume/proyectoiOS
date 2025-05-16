//
//  southpark_api.swift
//  aplicacion_final
//
//  Created by alumno on 5/7/25.
//

import SwiftUI

class FuturammaAPI: Codable{
    let url_base = "https://futuramaapi.com/api"

    
    //Personajes
    func descargar_pagina_personajes() async -> PaginaResultado_Personaje? {
        let ubicacion_recurso = "/characters"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_personajes(id: Int) async -> Personaje?{
        let ubicacion_recurso = "/characters/\(id)"
        return await descargar(recurso: ubicacion_recurso)
    }
    //Episodios
    func descargar_pagina_episodios() async -> PaginaResultado_Episodio? {
        let ubicacion_recurso = "/episodes"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_episodios(id: Int) async -> Episodio?{
        let ubicacion_recurso = "/episodes/\(id)"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    //Temporadas
    func descargar_pagina_temporadas() async -> PaginaResultado_Temporada? {
        let ubicacion_recurso = "/seasons"
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_temporadas(id: Int) async -> Temporada?{
        let ubicacion_recurso = "/seasons/\(id)"
        return await descargar(recurso: ubicacion_recurso)
    }
   
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async ->TipoGenerico? {
        do{
            guard let url = URL(string: "\(url_base)\(recurso)") else {throw ErroresDeRed.badURL}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else {throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else {
                print("Código de estado HTTP recibido: \(respuesta.statusCode)")
                throw ErroresDeRed.badStatus
            }
            do{
                let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                return respuesta_decodificada
            }
            catch let error as NSError{
                print("El error que tienes es:  \(error.debugDescription)")
                throw ErroresDeRed.fallaAlConvertirRespuesta
            }
            
        }
        catch ErroresDeRed.badURL {
            print("Hay un error en la URL, revisala porfa")
        }
        catch ErroresDeRed.badResponse {
            print("Revisa la respuesta")
        }
        catch ErroresDeRed.badStatus {
            print("Tienes un estatus negativo")
        }
        catch ErroresDeRed.fallaAlConvertirRespuesta {
            print("Tienes mal el modelo o la implementacion de este mismo")
            print("En SouthParkApi")
        }
        
        catch ErroresDeRed.invalidRequest {
            print("Peticion Invalida")
        }
        catch {
            print("Este mensaje no lo deberias ver, algo salio mal...")
        }
        
        return nil
    }
    
}
