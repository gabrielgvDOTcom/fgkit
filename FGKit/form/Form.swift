//
//  Form.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/12/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

public enum FGFormType {

    case dni
    case required
    case email
    case equal_to(_ value: String)
    case max_length(_ value: Int)
    case min_length(_ value: Int)
}

/// Estructura *FGForm*, una pequeña clase validadora de campos.
public struct FGForm {
    
    var form: [FGFormField] = []
    
    public init(_ form: [[String : Any]]) {
        self.form = Mapper<FGFormField>().mapArray(JSONObject: form)!
    }
    public func validate(_ completion: @escaping (NSError?) -> (Void)) -> Void {
        for item in form {
            for rule in item.rules {
                let field: String! = String(NSString(string: item.field.description))
                guard (field.lowercased() != "<null>") else {
                    completion(FGMessage(description: "El campo \(item.label!) es requerido").error)
                    return
                }
                switch rule {
                case .required:
                    guard field.length() >= 1 else {
                        completion(FGMessage(description: "El campo \(item.label!) es requerido").error)
                        return
                    }
                case .email:
                    guard field.email() else {
                        completion(FGMessage(description: "El campo \(item.label!) no contiene un correo electrónico valido").error)
                        return
                    }
                case .dni:
                    guard FGRun.validate(field) else {
                        completion(FGMessage(description: "El \(item.label!) ingresado no contiene un formato correcto").error)
                        return
                    }
                case .equal_to(let value):
                    guard field.elementsEqual(value) else {
                        completion(FGMessage(description: "Existen campos en el formulario que no coinciden").error)
                        return
                    }
                case .max_length(let value):
                    guard field.length() <= value else {
                        completion(FGMessage(description: "El campo \(item.label!) no puede ser mayor de \(value) caracteres.").error)
                        return
                    }
                case .min_length(let value):
                    guard field.length() >= value else {
                        completion(FGMessage(description: "El campo \(item.label!) no puede ser menor de \(value) caracteres.").error)
                        return
                    }
                }
            }
        }
        completion(nil)
    }
}
