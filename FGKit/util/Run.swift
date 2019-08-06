//
//  Run.swift
//  FGKit
//
//  Created by Gabriel Gárate Vivanco on 8/6/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

/// Estructura *RUN*, funciones utiles para el trabajo con este dato.
public struct Run {

    /** Esta función formatea el *RUN* según parametros enviados.

    Forma de uso:
    ```
    Run.clean("12.345.678-5") //123456785
    Run.clean("12.345.678-5", ["."]) //12345678-5
    Run.clean("12.345.678-5", ["-"]) //12.345.6785
    ```
    - Parameters:
        - run: *RUN* a formatear.
        - params: (opcional) parametros a eliminar.
    - Returns: devolvera el *RUN* formateado.*/
    public static func clean(_ run: String, _ params: [String]? = []) -> String {
        var tmp = run
        if let params = params {
            for item in params {
                tmp = tmp.replacingOccurrences(of: item, with: "", options: .literal, range: nil)
            }
        } else {
            tmp = tmp
                .replacingOccurrences(of: ".", with: "", options: .literal, range: nil)
                .replacingOccurrences(of: "-", with: "", options: .literal, range: nil)
        }
        return tmp.uppercased()
    }

    /** Esta función formatea el *RUN* agregando caracteres como puntos y guión.

    Forma de uso:
    ```
    Run.format("123456785") //12.345.678-5
    ```
    - Parameter run: *RUN* a formatear.
    - Returns: devolvera el *RUN* formateado, con puntos y guión.*/
    public static func format(_ run: String) -> String {
        let formatter = NumberFormatter()
        formatter.currencySymbol = ""
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.formatterBehavior = NumberFormatter.Behavior.behavior10_4
        formatter.locale = Locale(identifier: "es_CL")
        
        let separate = self.separate(run)
        guard !separate.0.isEmpty, !separate.1.isEmpty else { return run }
        return formatter
            .string(from: NSNumber(integerLiteral: Int(separate.1.filter("01234567890.".contains))!))!
            .appending("-")
            .appending(separate.0)
    }

    /** Esta función valida el *RUN* ingresado haciendo la operación para comparar su digito verificador.

    Forma de uso:
    ```
    Run.validate("123456785") //true
    Run.validate("126783459") //false
    ```
    - Parameter run: *RUN* a validar.
    - Returns: devolvera true o false dependiendo su validación. */
    public static func validate(_ run: String) -> Bool {
        guard NSPredicate(format: "SELF MATCHES %@", "[0-9]{1,2}.[0-9]{3}.[0-9]{3}-[0-9-K]{1}")
            .evaluate(with: self.format(run)) else { return false }
        return self.validateDV(run)
    }

    //MARK: - Private Functions
    private static func validateDV(_ run: String) -> Bool {
        guard NSPredicate(format: "SELF MATCHES %@", "^(\\d{1,3}(\\.?\\d{3}){2})\\-?([\\dkK])$")
            .evaluate(with: run) else { return false }
        let validate = self.separate(run)
        return self.getDv(from: validate.1).elementsEqual(validate.0)
    }
    private static func getDv(from run: String) -> String {
        var acumulado: Int = 0
        var ti: Int = 2
        
        for index in stride(from: run.count - 1, through: 0, by: -1) {
            let n = Array(run)[index]
            let nl = String(n)
            guard let vl = Int(nl) else {
                return ""
            }
            acumulado += vl * ti
            
            if (ti == 7) {
                ti = 1
            }
            ti += 1
        }
        
        let resto: Int = acumulado % 11
        let numericDigit: Int = 11 - resto
        var digito: String = "0"
        
        if (numericDigit <= 9) {
            digito = String(numericDigit);
        } else if (numericDigit == 10) {
            digito = "K"
        }

        return digito
    }
    private static func separate(_ run: String) -> (String, String) {
        guard !run.isEmpty, run.count > 2 else { return ("", "") }
        return (
            String(self.clean(run).last!),
            String(self.clean(run).dropLast())
        )
    }
}
