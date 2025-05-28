//
//  estilo_fecha.swift
//  aplicacion_final
//
//  Created by alumno on 5/28/25.
//

import Foundation
import SwiftUI

func fechaMx(_ dateString: String?) -> String {
    guard let dateString = dateString else {
        return "No disponible"
    }
    let isoFormatter = ISO8601DateFormatter()
    isoFormatter.formatOptions = [.withFullDate]
    if let date = isoFormatter.date(from: dateString) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "es_MX")
        formatter.dateStyle = .long
        return formatter.string(from: date)
    } else {
        return "No disponible"
    }
}
