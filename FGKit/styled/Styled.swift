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
    
    /// Estructura UILabel, manejo de estilos para elementos UILabel.
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
    public struct Icon {

        public let name: String
        public let color: UIColor
        public let size: CGFloat

        public init(name: String, color: UIColor, size: CGFloat) {
            self.name = name
            self.color = color
            self.size = size
        }
    }
    public struct Image {
        
        public init() {}
    }
    /// Estructura UIView, manejo de estilos para elementos UIView.
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
    /// Estructura UIButton, manejo de estilos para elementos UIButton.
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
