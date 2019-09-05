//
//  Style.swift
//  weeKGKit
//
//  Created by Gabriel Gárate Vivanco on 2/22/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

/// Estructura de Estilos, funciones y estructuras utiles para el manejo de estilos en elementos.
public struct Styled {
    
    /// Estructura Text, manejo de estilos para elementos UILabel.
    public struct Text {

        /// fuente del texto
        public let font: UIFont
        /// color del texto
        public let color: UIColor

        /**
         Inicializa un nuevo elemento Text para uso en UILabel.
         
         Forma de uso:
         ```
         Styled.Text(
            font: UIFont(.regular, size: 16),
            color: UIColor.gray
         )
         ```
         - Parameters:
            - font: fuente del texto
            - color: color del texto
         
         - Returns: Un objeto tipo Styled.Text
         */
        public init(font: UIFont, color: UIColor) {
            self.font = font
            self.color = color
        }
    }
    /// Estructura Icon, manejo de estilos para elementos UIImageView.
    public struct Icon {

        /// nombre de la imagen
        public let name: String
        /// tinte de la imagen
        public let color: UIColor
        /// tamaño de la imagen
        public let size: CGFloat

        /**
         Inicializa un nuevo elemento Icon para uso en UIImageView.
         
         Forma de uso:
         ```
         Styled.Icon(
            name: "icon",
            color: UIColor.gray,
            size: 25.0
         )
         ```
         - Parameters:
             - name: color del fondo
             - color: tinte de la imagen
             - size: tamaño de la imagen
         
         - Returns: Un objeto tipo Styled.Icon
         */
        public init(name: String, color: UIColor, size: CGFloat) {
            self.name = name
            self.color = color
            self.size = size
        }
    }
    public struct Image {
        
        public init() {}
    }
    /// Estructura View, manejo de estilos para elementos UIView.
    public struct View {
        
        /// color del fondo
        public let bgColor: UIColor
        /// borde redondeado
        public let cornerRadius: CGFloat
        
        /**
         Inicializa un nuevo elemento View para uso en UIView.

         Forma de uso:
         ```
         Styled.View(
            bgColor: UIColor.gray,
            corner: 5.0
         )
         ```
         - Parameters:
             - bgColor: color del fondo
             - corner: borde redondeado en Float
         
         - Returns: Un objeto tipo Styled.View
         */
        public init(bgColor: UIColor, corner: CGFloat) {
            self.bgColor = bgColor
            self.cornerRadius = corner
        }
    }
    /// Estructura TextField, manejo de estilos para elementos UITextField.
    public struct TextField {
        
        /// fuente del texto
        public let font: UIFont
        /// color del texto
        public let color: UIColor
        /// alineación del texto
        public let align: NSTextAlignment
        /// tipo de borde
        public let borderStyle: UITextField.BorderStyle
        
        /**
         Inicializa un nuevo elemento TextField para uso en UITextField.
         
         Forma de uso:
         ```
         Styled.TextField(
             font: UIFont(.regular, size: 16),
             color: UIColor.black,
             align: .right,
             border: .none,
         )
         ```
         - Parameters:
             - font: fuente del texto
             - color: color del texto
             - align: alineación del texto
             - border: estilo del borde
         
         - Returns: Un objeto tipo Styled.TextField
         */
        public init(font: UIFont, color: UIColor, align: NSTextAlignment, border: UITextField.BorderStyle) {
            self.font = font
            self.color = color
            self.align = align
            self.borderStyle = border
        }
    }
    /// Estructura Button, manejo de estilos para elementos UIButton.
    public struct Button {

        /// fuente del texto
        public let font: UIFont
        /// icono acompañante?
        public let image: UIImage?
        /// color del fondo
        public let bgColor: UIColor
        /// color del texto
        public let tintColor: UIColor
        /// borde redondeado
        public let cornerRadius: CGFloat

        /**
         Inicializa un nuevo elemento Button para uso en UIButton.

         Forma de uso:
         ```
         Styled.Button(
            font: UIFont(.regular, size: 16),
            bgColor: UIColor.gray,
            tintColor: UIColor.white,
            corner: 5.0,
            image: nil
         )
         ```
         - Parameters:
             - font: fuente del texto
             - bgColor: color del fondo
             - tintColor: color del texto
             - corner: borde redondeado en Float
             - image: (opcional) icono a mostrar

         - Returns: Un objeto tipo Styled.Button
         */
        public init(font: UIFont, bgColor: UIColor, tintColor: UIColor, corner: CGFloat, image: UIImage?) {
            self.font = font
            self.image = image
            self.bgColor = bgColor
            self.tintColor = tintColor
            self.cornerRadius = corner
        }
    }
}
