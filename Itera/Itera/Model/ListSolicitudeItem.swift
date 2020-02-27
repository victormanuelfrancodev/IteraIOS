//
//  ListSolicitudeItem.swift
//  Itera
//
//  Created by Victor Manuel Lagunas Franco on 27/02/20.
//  Copyright © 2020 Victor Manuel Lagunas Franco. All rights reserved.
//

import UIKit

import Foundation

// MARK: - SolicitudeItem
struct ListSolicitudeItem: Codable {
    let usuarioID, folio, proveedor, cliente: String
    let folioInterno: Int
    let fechaInicio, fechaFin, estado: String

    enum CodingKeys: String, CodingKey {
        case usuarioID = "usuario_id"
        case folio, proveedor, cliente, folioInterno, fechaInicio, fechaFin, estado
    }
}

import Foundation

// MARK: - SolicitudeItemElement
struct ListSolicitudeItemResponse: Codable {
    let folio, proveedor, cliente: String
    let movimiento, folioInterno: Int
    let fechaInicio, notas: String
}

