//
//  Dictionary+Extensions.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 15/08/2025.
//

extension Dictionary {
  static func + (lhs: Dictionary, rhs: Dictionary?) -> Dictionary {
    if rhs == nil {
      return lhs
    } else {
      var dic = lhs
      rhs!.forEach { dic[$0] = $1 }
      return dic
    }
  }
}
