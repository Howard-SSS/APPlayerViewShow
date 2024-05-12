//
//  PrintFormatProtocol.swift
//  APPlayerViewShow
//
//  Created by Howard-Zjun on 2024/05/12.
//

import Foundation

protocol PrintFormatProtocol {

    func formatPrint(_ text: String)
}

extension PrintFormatProtocol {
    
    func formatPrint(_ text: String) {
        print("[\(type(of: self))-\(#function)-\(#line)]: \(text)")
    }
}
