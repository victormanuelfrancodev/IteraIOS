//
//  Login.swift
//  Itera
//
//  Created by Victor Manuel Lagunas Franco on 27/02/20.
//  Copyright © 2020 Victor Manuel Lagunas Franco. All rights reserved.
//


import Foundation

// MARK: - LoginItem
struct LoginItem: Codable {
    let usuario, password: String
}

struct ResponseLoginItem: Codable {
    let usuario, usuarioID: String
    let logueado: Bool

    enum CodingKeys: String, CodingKey {
        case usuario
        case usuarioID = "usuario_id"
        case logueado
    }
}
