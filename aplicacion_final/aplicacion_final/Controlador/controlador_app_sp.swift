//
//  controlador_app_sp.swift
//  aplicacion_final
//
//  Created by alumno on 5/9/25.
//

import Foundation

@Observable
@MainActor
public class ControladorAplicacion_SP{
    
    var personaje_seleccionado: Personaje? = nil
    var episodio_a_mostrar: Episodio? = nil

    
    //Personaje
    var personaje: Personaje? = nil
    var lista_personaje: PaginaResultado_Personaje? = nil
    //Episodio
    var episodio: Episodio? = nil
    var lista_episodio: PaginaResultado_Episodio? = nil
    //Temporada
    var temporada: Temporada? = nil
    var lista_temporada: PaginaResultado_Temporada? = nil
    
    init(){
        Task.detached(priority : .high){
            await self.descargar_personajes()
            await self.descargar_episodios()
            await self.descargar_temporadas()
            //await self.descargar_ubicaiones()
        }
    }
    
    func descargar_personajes() async{
        guard let pagina_descargada_P: PaginaResultado_Personaje = try? await
                FuturammaAPI().descargar_pagina_personajes() else {return}
        self.lista_personaje = pagina_descargada_P
    }
    
    func descargar_episodios() async{
        guard let pagina_descargada_E: PaginaResultado_Episodio = try? await
                FuturammaAPI().descargar_pagina_episodios() else {return}
        self.lista_episodio = pagina_descargada_E
    }
    
    func descargar_temporadas() async{
        guard let pagina_descargada_T: PaginaResultado_Temporada = try? await
                FuturammaAPI().descargar_pagina_temporadas() else {return}
        self.lista_temporada = pagina_descargada_T
    }
    
    
    
    
    
    func descargar_info_personaje(id: Int) async{
        guard let character: Personaje = try? await
                FuturammaAPI().descargar_informacion_personajes(id: id) else {return}
        
        self.personaje = character
    }
    
    func descargar_info_episodio(id: Int) async{
        guard let capitulo: Episodio = try? await
                FuturammaAPI().descargar_informacion_episodios(id: id) else {return}
        
        self.episodio = capitulo
    }
    
    func descargar_info_temporada(id: Int) async{
        guard let season: Temporada = try? await
                FuturammaAPI().descargar_informacion_temporadas(id: id) else {return}
        
        self.temporada = season
    }

    

    //-----------------------------------------//
    
    func descargar_informacion_personaje(id: Int){
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    func descargar_informacion_episodio(id: Int){
        Task.detached(operation: {
            await self.descargar_info_episodio(id: id)
        })
    }
    
    func descargar_informacion_temporada(id: Int){
        Task.detached(operation: {
            await self.descargar_info_temporada(id: id)
        })
    }
   
}
