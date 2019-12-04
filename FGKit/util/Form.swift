//
//  Form.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/12/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Foundation

public enum FGFormRule {

    case dni
    case email
    case required
    case equal_to(String)
    case number(_ type: typeNumber)

    public enum typeNumber {

        case only
        case min(Int)
        case max(Int)
    }
}
extension FGFormRule {
    
    func validate(_ t: String) -> String? {
        switch self {
        case .dni:      guard FGRun.validate(t) else { return "El %@ ingresado no contiene un formato correcto" }
        case .email:    guard t.email else { return "El campo %@ no contiene un correo electrónico valido" }
        case .required: guard t.length >= 1 else { return "El campo %@ es requerido" }
        case .equal_to(let i):  guard t.elementsEqual(i) else { return "Existen campos en el formulario que no coinciden" }
        case .number(.min(let i)):  guard t.length >= i else { return "El campo %@ no puede ser menor de \(i) caracteres." }
        case .number(.max(let i)):  guard t.length <= i else { return "El campo %@ no puede ser mayor de \(i) caracteres." }
        case .number(.only):        guard CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: t)) else {
                return "El campo %@ unicamente puede contener dígitos"
            }
        }
        return nil
    }
}
class FGFormField {
    
    var field: String! = ""
    var placeholder: String! = ""
    var rules: [FGFormRule] = []
}
/// Estructura *FGForm*, una pequeña clase validadora de campos.
public class FGForm {
    
    private var form: [FGFormField] = []
    
    public init() {}
    
    public func add(_ field: String, _ placeholder: String, with rules: [FGFormRule]) {
        let a = FGFormField()
        a.field = field
        a.placeholder = placeholder
        a.rules = rules
        form.append(a)
    }
    public func validate(_ completion: @escaping (NSError?) -> Void) {
        for f in form {
            if let msg = f.rules.compactMap({ $0.validate(f.field) }).first {
                return completion(NSError(
                    domain: "cl.weekg.FGKit",
                    code: 0,
                    userInfo: [NSLocalizedDescriptionKey: String(format: msg, f.placeholder)]
                ))
            }
        }
        completion(nil)
    }
}
