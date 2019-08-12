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
                    completion(nil) //"El campo %@ es requerido. item.label"
                    return
                }
                switch rule {
                case .required:
                    guard field.length() >= 1 else {
                        debugPrint("El campo %@ es requerido.", item.label)
                        return
                    }
                case .email:
                    guard field.email() else {
                        debugPrint("El campo %@ no contiene un correo electrónico valido.", item.label)
                        return
                    }
                case .dni:
                    guard FGRun.validate(field) else {
                        debugPrint("El %@ ingresado no contiene un formato correcto.", item.label)
                        return
                    }
                case .equal_to(let value):
                    guard field.elementsEqual(value) else {
                        debugPrint("Existen campos en el formulario que no coinciden.")
                        return
                    }
                case .max_length(let value):
                    guard field.length() <= value else {
                        debugPrint("El campo %@ no puede ser mayor de %@ caracteres.", field, value)
                        return
                    }
                case .min_length(let value):
                    guard field.length() >= value else {
                        debugPrint("El campo %@ no puede ser menor de %@ caracteres.", field, value)
                        return
                    }
                }
            }
        }
        completion(nil)
    }
}
