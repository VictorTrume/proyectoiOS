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
    var familia_a_mostrar: Familia? = nil
    var ubicacion_a_mostrar: Ubicacion? = nil
    
    //Personaje
    var personaje: Personaje? = nil
    var lista_personaje: PaginaResultado_Personaje? = nil
    //Episodio
    var episodio: Episodio? = nil
    var lista_episodio: PaginaResultado_Episodio? = nil
    //Familias
    var familia: Familia? = nil
    var lista_familia: PaginaResultado_Familia? = nil
    //Ubicaiones
    var ubicaciones: Ubicacion? = nil
    var lista_ubicacion: PaginaResultado_Ubicacion? = nil
    
    init(){
        Task.detached(priority : .high){
            await self.descargar_personajes()
            await self.descargar_episodios()
            await self.descargar_familia()
            await self.descargar_ubicaiones()
        }
    }
    
    func descargar_personajes() async{
        guard let pagina_descargada_P: PaginaResultado_Personaje = try? await
                SouthParkAPI().descargar_pagina_personajes() else {return}
        self.lista_personaje = pagina_descargada_P
    }
    
    func descargar_episodios() async{
        guard let pagina_descargada_E: PaginaResultado_Episodio = try? await
                SouthParkAPI().descargar_pagina_episodios() else {return}
        self.lista_episodio = pagina_descargada_E
    }
    
    func descargar_familia() async{
        guard let pagina_descargada_F: PaginaResultado_Familia = try? await
                SouthParkAPI().descargar_pagina_familias() else {return}
        self.lista_familia = pagina_descargada_F
    }
    
    func descargar_ubicaiones() async{
        guard let pagina_descargada_U: PaginaResultado_Ubicacion = try? await
                SouthParkAPI().descargar_pagina_ubicaciones() else {return}
        self.lista_ubicacion = pagina_descargada_U
    }
    
    
    
    
    func descargar_info_personaje(id: Int) async{
        guard let character: Personaje = try? await
                SouthParkAPI().descargar_informacion_personajes(id: id) else {return}
        
        self.personaje = character
    }
    
    func descargar_info_episodio(id: Int) async{
        guard let capitulo: Episodio = try? await
                SouthParkAPI().descargar_informacion_episodios(id: id) else {return}
        
        self.episodio = capitulo
    }
    
    func descargar_info_familia(id: Int) async{
        guard let family: Familia = try? await
                SouthParkAPI().descargar_informacion_familias(id: id) else {return}
        
        self.familia = family
    }
    
    func descargar_info_ubicacion(id: Int) async{
        guard let locate: Ubicacion = try? await
                SouthParkAPI().descargar_informacion_ubicaciones(id: id) else {return}
        
        self.ubicaciones = locate
    }

    
    
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
    func descargar_informacion_familia(id: Int){
        Task.detached(operation: {
            await self.descargar_info_familia(id: id)
        })
    }
    func descargar_informacion_ubicacion(id: Int){
        Task.detached(operation: {
            await self.descargar_info_ubicacion(id: id)
        })
    }
}
