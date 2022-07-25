//
//  RoundButton.swift
//  Demo_Caculator
//
//  Created by Nguyễn Đình Kiên on 19/07/2022.
//

import UIKit
@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var roundButton:Bool = false {
        didSet{
            if roundButton{
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton{
            layer.cornerRadius = frame.height / 2
        }
    }
}
