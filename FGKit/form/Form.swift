//
//  Form.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/12/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

public class FGValidator {
    
    private var form: [String] = []
    
    public init() {}
    
    public func add(_ field: String, _ placeholder: String, with rules: [FGRule]) {
        form.append("hola")
        //return rules.compactMap({ $0.check(text) }).first
    }
    public func validate(_ completion: @escaping (NSError?) -> Void) {
        
    }
}
public struct FGRule {
    
    let check: (String) -> String?
    
    static let required = FGRule(check: {
        return $0.length == 0 ? "Must not be empty" : nil
    })
}

public enum FGFormType {

    case dni
    case required
    case email
    case distinc_to(String)
    case equal_to(String)
    case max_length(Int)
    case min_length(Int)
    case max_price(Int)
    case min_price(Int)
    case multiple(Int, _ price: Bool)
}



/// Estructura *FGForm*, una pequeña clase validadora de campos.
public struct FGForm {
    
    var form: [FGFormField] = []
    
    public init(_ form: [[String : Any]]) {}
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
                    guard field.length >= 1 else {
                        completion(FGMessage(description: "El campo \(item.label!) es requerido").error)
                        return
                    }
                case .email:
                    guard field.email else {
                        completion(FGMessage(description: "El campo \(item.label!) no contiene un correo electrónico valido").error)
                        return
                    }
                case .dni:
                    guard FGRun.validate(field) else {
                        completion(FGMessage(description: "El \(item.label!) ingresado no contiene un formato correcto").error)
                        return
                    }
                case .distinc_to(let value):
                    guard !field.elementsEqual(value) else {
                        completion(FGMessage(description: "El campo \(item.label!) debe ser distinto de \(value)").error)
                        return
                    }
                case .equal_to(let value):
                    guard field.elementsEqual(value) else {
                        completion(FGMessage(description: "Existen campos en el formulario que no coinciden").error)
                        return
                    }
                case .max_price(let value):
                    guard (field as NSString).integerValue <= value else {
                        completion(FGMessage(description: "El campo \(item.label!) no puede ser mayor de \(value.price).").error)
                        return
                    }
                case .min_price(let value):
                    guard (field as NSString).integerValue >= value else {
                        completion(FGMessage(description: "El campo \(item.label!) no puede ser menor de \(value.price).").error)
                        return
                    }
                case .max_length(let value):
                    guard field.length <= value else {
                        completion(FGMessage(description: "El campo \(item.label!) no puede ser mayor de \(value) caracteres.").error)
                        return
                    }
                case .min_length(let value):
                    guard field.length >= value else {
                        completion(FGMessage(description: "El campo \(item.label!) no puede ser menor de \(value) caracteres.").error)
                        return
                    }
                case .multiple(let value, let price):
                    let a = (field.numbers as NSString).integerValue
                    guard a.isMultiple(of: value) else {
                        completion(FGMessage(description: "El campo \(item.label!) no es multiplo de \(price ? value.price : String(value)).").error)
                        return
                    }
                }
            }
        }
        completion(nil)
    }
}
