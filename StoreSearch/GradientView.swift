//
//  GradientView.swift
//  StoreSearch
//
//  Created by Кирилл Дутов on 18.03.2021.
//

import UIKit

class GradientView: UIView {
    
    // Устанавливаем полностю прозрачный цвет фона
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }
    
    // Рисуем градиент поверх прозрачного фона, чтобы он сливался с тем, что находится ниже.
    override func draw(_ rect: CGRect) {
        
        // Создаем две матрицы, содержащие цветные полосы для градиента
        let components: [CGFloat] = [ 0, 0, 0, 0.3, 0, 0, 0, 0.7 ]
        let locations: [CGFloat] = [ 0, 1 ]
        
        // Создаем градиент
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient(colorSpace: colorSpace, colorComponents: components, locations: locations, count: 2)
        
        // Рисуем фигуру
        let x = bounds.midX
        let y = bounds.midY
        let centerPoint = CGPoint(x: x, y : y)
        let radius = max(x, y)
        
        let context = UIGraphicsGetCurrentContext()
        context?.drawRadialGradient(gradient!,
                                    startCenter: centerPoint, startRadius: 0,
                                    endCenter: centerPoint, endRadius: radius,
                                    options: .drawsAfterEndLocation)
    }
}
