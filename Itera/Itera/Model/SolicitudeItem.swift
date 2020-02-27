//
//  SolicitudeItem.swift
//  Itera
//
//  Created by Victor Manuel Lagunas Franco on 27/02/20.
//  Copyright © 2020 Victor Manuel Lagunas Franco. All rights reserved.
//

import Foundation

// MARK: - SolicitudeItem
struct SolicitudeItem: Codable {
    let folio, proveedor, cliente: String
    let movimiento, folioInterno: Int
    let fechaInicio, notas: String
}

import Foundation

// MARK: - SolicitudeItem
struct SolicitudeItemResponse: Codable {
    let idRegistro: Int
    let accion, estatus, descripcion: String

    enum CodingKeys: String, CodingKey {
        case idRegistro = "id_registro"
        case accion
        case estatus = "Estatus"
        case descripcion
    }
}
