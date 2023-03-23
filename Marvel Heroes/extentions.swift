//
//  extentions.swift
//  Marvel Heroes
//
//  Created by Umar Pirmahomed on 23/03/2023.
//

import Foundation
import CryptoKit

extension String {
var MD5: String {
        let value = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return value.map { String(format: "%02hhx", $0) }.joined()
    }
}
