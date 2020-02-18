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
        case .dni: guard FGRun.validate(t) else { return message(key: "form.incorrect.format") }
        case .email: guard t.email else { return message(key: "form.incorrect.format") }
        case .required: guard t.length >= 1 else { return message(key: "form.required") }
        case .equal_to(let i): guard t.elementsEqual(i) else { return message(key: "form.equal_to") }
        case .number(.min(let i)): guard t.length >= i else { return message(key: "form.number.min") }
        case .number(.max(let i)): guard t.length <= i else { return message(key: "form.number.max") }
        case .number(.only): guard CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: t)) else { return message(key: "form.number.only") }
        }
        return nil
    }

    private func message(key: String) -> String {
        guard let msg = Bundle(identifier: "cl.weekg.FGKit")?.localizedString(forKey: key, value: nil, table: nil) else { return "" }
        return msg
    }
}
class FGFormField {
    
    var field: String
    var placeholder: String
    var rules: [FGFormRule] = []
    
    init(field: String, placeholder: String, rules: [FGFormRule]) {
        self.field = field
        self.placeholder = placeholder
        self.rules = rules
    }
}
/// Estructura *FGForm*, una pequeña clase validadora de campos.
public class FGForm {
    
    private var form: [FGFormField] = []
    
    public init() {}
    
    public func add(_ field: String, _ placeholder: String, with rules: [FGFormRule]) {
        form.append(FGFormField(field: field, placeholder: placeholder, rules: rules))
    }
    public func validate(_ success: () -> Void, _ error: (NSError) -> Void) {
        for f in form {
            if let msg = f.rules.compactMap({ $0.validate(f.field) }).first {
                let bundle = Bundle(for: type(of: self))
                return error(NSError(
                    domain: "cl.weekg.FGKit",
                    code: 0,
                    userInfo: [
                        NSLocalizedRecoverySuggestionErrorKey: String(format: msg, f.placeholder),
                        NSLocalizedDescriptionKey: bundle.localizedString(
                            forKey: "form.title",
                            value: nil,
                            table: nil
                        )
                    ]
                ))
            }
        }
        success()
    }

    @available(*, deprecated, message: "")
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
