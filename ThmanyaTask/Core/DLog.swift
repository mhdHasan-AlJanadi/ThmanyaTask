//
//  DLog.swift
//  ThmanyaTask
//
//  Created by MACBOOK on 15/08/2025.
//

///print to console just in Debug mode
public func DLog(
  _ items: Any...,
  separator: String = " ",
  terminator: String = "\n"
) {
  #if DEBUG
  let output = items.map { "\($0)" }.joined(separator: separator)
  Swift.print(output, terminator: terminator)
  #endif
}
